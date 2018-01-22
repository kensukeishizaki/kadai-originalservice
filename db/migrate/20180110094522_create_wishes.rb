class CreateWishes < ActiveRecord::Migration[5.0]
  def change
    create_table :wishes do |t|
      t.references :user, foreign_key: true
      t.references :attraction, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :attraction_id], unique: true
    end
  end
end
