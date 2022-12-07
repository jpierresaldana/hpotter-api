class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :image_url
      t.text :review
      t.string :actor

      t.timestamps
    end
  end
end
