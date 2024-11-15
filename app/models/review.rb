class Review < ApplicationRecord
    belongs_to :book #, inverse_of :reviews
    belongs_to :user #, inverse_of :users
    validates_presence_of :book
    validates_presence_of :user

    validates_presence_of :rating, :content
    validates :rating, numericality: true

    self.per_page = 3
end
