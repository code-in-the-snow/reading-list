require 'spec_helper'

feature 'User views index page' do
  scenario 'user sees last title entered' do

    test_book = Book.new(title: 'Green Eggs and Ham',
                         author: 'Dr. Seuss',
                         fiction: true,
                         mystery: false,
                         date_finished: 'May 2, 2011')
    visit '/'

    expect(page).to have_content "Green Eggs and Ham"
  end
end
