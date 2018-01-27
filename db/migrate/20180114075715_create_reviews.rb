class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :attraction, foreign_key: true
      t.text :comment
      t.integer :rate, default: 0

      t.timestamps
    end
  end
end
