require 'spec_helper'
require_relative '../../app/models/book.rb'

RSpec.describe Book do
  describe "#initialization" do
    book = Book.new(title: 'Delete All Suspects',
                    author: 'Donna Andrews',
                    fiction: true,
                    mystery: true,
                    completed: "17/12/2005")
      it 'returns Book attributes' do

        expect(book.title).to eq("Delete All Suspects")
        expect(book.author).to eq("Donna Andrews")
        expect(book.fiction).to eq(true)
        expect(book.mystery).to eq(true)
        expect(book.completed).to eq("17/12/2005")
      end
  end
end
