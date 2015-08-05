$(document).ready(function() {
  $('#book-form').hide();
  $.ajax({
    type: "GET",
    url: "/books.json",
    dataType: "json",
    success: function(data) {
      var books = data.books;
      var nonFiction = $('.nonfiction');
      var mysteryFiction = $('.mystery-fiction');
      var otherFiction = $('.other-fiction');

      books.forEach(function(book) {
        var text = "<li>" + book.title + "</li>";
        if (book.fiction === true && book.mystery === true) {
          mysteryFiction.append(text);
        } else if (book.fiction === true && book.mystery === false) {
          otherFiction.append(text);
        } else {
          nonFiction.append(text);
        }
      });
    }
  });

  $("#get-form").click(function(){
   $("#book-form").slideDown(400);
   $("#get-form").hide();
  });


  $("#new-book-button").click(function(e) {
    e.preventDefault();

    $("#book-form").hide();
    $("#get-form").show();

    var newTitle = $('#title-text-field').val();
    var newAuthor = $('#author-text-field').val();
    var newDate = $('#completed-text-field').val();
    var mystery, fiction;
     if ($("#mystery").checked === true) {
       mystery = true;
     }
     if ($("#nonfiction").checked === true) {
       fiction = false;
     }

    var nonFiction = $('.nonfiction');
    var mysteryFiction = $('.mystery-fiction');
    var otherFiction = $('.other-fiction');

    $.ajax({
      type: "POST",
      url: "/books",
      data: { title: newTitle,
              author: newAuthor,
              fiction: fiction,
              mystery: mystery,
              completed: newDate
            },
      dataType: "json",
      success: function(book) {
        var text = "<li>" + book.title + "</li>";
        if (book.fiction === true && book.mystery === true) {
          mysteryFiction.append(text);
        } else if (book.fiction === true && book.mystery === false) {
          otherFiction.append(text);
        } else {
          nonFiction.append(text);
        }
      },
      ereror: function() {
        alert("Oops, something went wrong?!?");
      }
    });
  });
});
