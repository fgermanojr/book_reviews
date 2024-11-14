class Book < ApplicationRecord
  has_many :reviews # , inverse_of: :book

  validates :title, :author, :publication_year, :isbn, presence: true

  validate :isbn_format_validated

  def average_rating
    reviews = self.reviews

    avg_rating_str = if reviews.empty?
      ''
    else
      sum = 0
      reviews.each{|review| sum + review.rating}
      avg_rating = sum / reviews.count
      "%0.1f" % [avg_rating]
    end

    avg_rating_str
  end

  def isbn_format_validated
    unless isbn
      errors.add(:isbn, 'Isbn is Blank')
      return
    end

    # Anything goes for now: next ISBN 
    validated = true # TBD sw to simple regex; describe other options
    
    unless validated
      errors.add(:isbn, 'Invalid Isbn Format')
    end
  end
end