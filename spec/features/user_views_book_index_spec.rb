require 'spec_helper'

feature 'User views index page' do
  scenario 'user sees all titles in database', js: true do

    test_f = Book.create(title: 'Green Eggs and Ham',
                         author: 'Dr. Seuss',
                         fiction: true,
                         mystery: false,
                         completed: "05/02/2011")
    test_nf = Book.create(title: 'Learn Python the Hard Way',
                          author: 'Zed Shaw',
                          fiction: false,
                          mystery: false,
                          completed: "10/01/2014")
    test_nf = Book.create(title: 'Delete All Suspects',
                          author: 'Donna Andrews',
                          fiction: true,
                          mystery: true,
                          completed: "17/12/2005")

    visit '/'
    sleep(6.0)

    expect(page).to have_content "Green Eggs and Ham"
    expect(page).to have_content "Learn Python the Hard Way"
    expect(page).to have_content "Delete All Suspects"
  end
end

feature 'hidden from becomes visible', js: true do
  scenario "User clicks 'I finished another book'" do
    visit '/'
    click_button "I finished another book!"
    sleep(1.0)

    expect(page).to have_content "Latest Book"
  end
end

feature 'User adds a book to list' do
  scenario 'users adds a mystery', js: true do
    visit '/'
    click_button "I finished another book!"
    fill_in "title", with: "Bellman and Black"
    fill_in "author", with: "Diane Setterfield"
    fill_in "completed", with: "11/08/2015"
    choose "nonfiction"
    choose "other"

    click_button "Submit"
    sleep(5.0)
    expect(page).to have_content "Bellman and Black"
  end
end
