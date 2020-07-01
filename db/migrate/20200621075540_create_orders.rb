class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :postage,default: "800".to_i
      t.integer :payment_method,default: 0
      t.integer :total_payment
      t.integer :status,default: 0

      t.timestamps
    end
  end
end
