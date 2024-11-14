require 'rails_helper'

RSpec.describe Book, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let! (:book) do
    FactoryBot.build(:book,
      title: 'Quantum Man',
      author: 'Lawrence M Krauss',
      publication_year: 2011,
      isbn: 'ISBN 978-0-393-06471-1'
    )
  end

  context 'the model' do
    it 'is fails with no data' do
      expect(Book.new).not_to be_valid
    end
    it 'passes with data' do
      expect(book).to be_valid
    end
  end

  context 'field isbn' do
    it 'passes hardwired pass'
    it 'passes isbn 10 pattenn'
    it 'passes isbn 13 pattern'
    it 'passes full algorithm 10 pattern'
    it 'passes full alrorithm 13 pattern'
  end

  context 'avg rating' do
    it 'returns blank str when no ratings'
    it 'returns 3.0 when ratings 1 and 5'
  end
end
