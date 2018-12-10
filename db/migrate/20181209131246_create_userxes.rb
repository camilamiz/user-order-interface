class CreateUserxes < ActiveRecord::Migration[5.2]
  def change
    create_table :userxes do |t|
      t.string :name
      t.string :cpf
      t.string :email

      t.timestamps
    end
  end
end
