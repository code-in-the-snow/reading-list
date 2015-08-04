$(document).ready(function() {
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
        var text = "<li>" + book.text + "</li>";
        if (book.fiction === true && book.mystery === true) {
          mysteryFiction.append(text);
        } else if (book.fiction === true && book.mystery ==== false) {
          otherFiction.append(text);
        } else {
          nonFiction.append(text);
        }
      });
    }
  });
});




//
//       tasks.forEach(function(task) {
//         var text = "<li>" + task.text + "</li>";
//         if (task.important === true && task.urgent === true){
//           importantUrgent.append(text);
//         }
//         else if (task.important === true && task.urgent === false) {
//           importantNotUrgent.append(text);
//         }
//         else if (task.important === false && task.urgent === true) {
//           notImportantUrgent.append(text);
//         }
//         else if (task.important === false && task.urgent === false) {
//           notImportantNotUrgent.append(text);
//         }
//       });
//     },
//     error: function() {
//       alert("in the error block :( ")
//       // do something else
//     }
//   });
