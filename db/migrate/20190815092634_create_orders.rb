class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.text :name
      t.string :phone
      t.text :adress
      t.string :orders_input

      t.timestamps
    end
  end
end
