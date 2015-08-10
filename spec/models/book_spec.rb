require 'spec_helper'

RSpec.describe Book, type: :model do
  book = Book.new('Delete All Suspects',
                  'Donna Andrews',
                  true,
                  true,
                  "12/17/2005")
  describe "#initialization" do
    it 'returns Book attributes' do

      expect(book.title).to eq("Delete All Suspects")
      expect(book.author).to eq("Donna Andrews")
      expect(book.fiction).to eq(true)
      expect(book.mystery).to eq(true)
      expect(book.completed).to eq("12/17/2005")
    end
  end
end
