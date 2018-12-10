class CreateOrderxes < ActiveRecord::Migration[5.2]
  def change
    create_table :orderxes do |t|
      t.string :model
      t.string :imei
      t.decimal :annual_price
      t.integer :number_of_installments
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
