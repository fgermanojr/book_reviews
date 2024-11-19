 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/books", type: :request do

  before :each do
    @user = FactoryBot.create(:user, email: 'micky@mouse.com', password: 'password#9', password_confirmation: 'password#9')
    sign_in @user
  end

  def fix_url(url)
    # TBD there must be a setting for this; seems to be sticky?
    url.gsub('http://www.example.com/', 'http://0.0.0.0:3000/')
  end
  
  # Book. As you add validations to Book, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { title: 'Quantum Man', author: 'Lawrene M. Krauss',  publication_year: '2011', isbn: '978-0-393-06471-1' } 
    # skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    { foo: 'bar' }
    # skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Book.create! valid_attributes
      get fix_url(books_url)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      book = Book.create! valid_attributes
      get fix_url(book_url(book))
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get fix_url(fix_url(new_book_url))
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      book = Book.create! valid_attributes
      get fix_url(edit_book_url(book))
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Book" do
        expect {
          post fix_url(books_url), params: { book: valid_attributes }
        }.to change(Book, :count).by(1)
      end

      it "redirects to the created book" do
        post fix_url(books_url), params: { book: valid_attributes }
        expect(response).to redirect_to(book_url(Book.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Book" do
        expect {
          post fix_url(books_url), params: { book: invalid_attributes }
        }.to change(Book, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post fix_url(books_url), params: { book: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        # skip("Add a hash of attributes valid for your model")
        { publication_year: '2012' } 
      }

      it "updates the requested book" do
        book = Book.create! valid_attributes
        patch fix_url(book_url(book)), params: { book: new_attributes }
        book.reload

        expect(book.publication_year).to eql('2012')
        # skip("Add assertions for updated state")
      end

      it "redirects to the book" do
        book = Book.create! valid_attributes
        patch fix_url(book_url(book)), params: { book: new_attributes }
        book.reload
        expect(response).to redirect_to(book_url(book))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        book = Book.create! valid_attributes
        patch fix_url(book_url(book)), params: { book: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested book" do
      book = Book.create! valid_attributes
      expect {
        delete fix_url(book_url(book))
      }.to change(Book, :count).by(-1)
    end

    it "redirects to the books list" do
      book = Book.create! valid_attributes
      delete fix_url(book_url(book))
      expect(response).to redirect_to(books_url)
    end
  end
end
