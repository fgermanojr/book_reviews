# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

def generate_user
    user = User.new
    user.email = 'frank@germano.org'
    user.password = 'valid_password'
    user.password_confirmation = 'valid_password'
    user.save!
end

def generate_review_text
    paragraphs = Faker::Lorem.paragraphs(number: 4)
    paragraphs.inject('') {|str, p| str << "#{p}\n"}
end

def generate_isbn_text
   x = Faker::Code.isbn(base: 13) # yields "557186730307-8"
   # Format to my liking
   "ISBN #{x[0..2]}-#{x[3..3]}-#{x[4..6]}-#{x[7..11]}-#{x[13]}"

   # Faker:Code.isbn(base: 10) # yields "457389822-0"
end

def generate_books
    books_array = []
    8.times { |i| books_array << { title: Faker::Book.title, author: Faker::Book.author, publication_year: (1947 + rand(77)), isbn: generate_isbn_text } } # thru 2024
    Book.create(books_array) 
end

def generate_reviews
    reviews_array = []
    20.times { |i| reviews_array <<  { user_id: User.first.id, book_id: (1 + rand(Book.count)), rating: (1 + rand(5)), content:  generate_review_text } }
    Review.create(reviews_array)
    
end

# mainline
generate_user
generate_books
generate_reviews


