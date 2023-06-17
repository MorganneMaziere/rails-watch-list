class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :movie_id
      t.text :content
      t.integer :rating
      

      t.timestamps
    end
  end
end
