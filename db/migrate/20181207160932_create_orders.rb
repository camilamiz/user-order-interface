class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :model
      t.string :imei
      t.decimal :annual_price
      t.integer :number_of_installments

      t.timestamps
    end
  end
end
