class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.integer :end_user_id
      t.string :postal_code
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
