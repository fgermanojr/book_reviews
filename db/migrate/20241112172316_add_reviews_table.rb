class AddReviewsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :users
      t.belongs_to :books
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end