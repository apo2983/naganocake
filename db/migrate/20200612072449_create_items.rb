class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :image_id
      t.string :name
      t.text :detail
      t.integer :price
      t.boolean :is_sale,default: true

      t.timestamps
    end
  end
end
