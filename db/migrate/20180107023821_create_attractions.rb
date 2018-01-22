class CreateAttractions < ActiveRecord::Migration[5.0]
  def change
    create_table :attractions do |t|
      t.string :name
      t.text :content
      t.integer :themepark_id

      t.timestamps
    end
  end
end
