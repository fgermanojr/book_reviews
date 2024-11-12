class AddBooksTable < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publication_year
      t.string :isbn
    end
  end
end
