class AddUserxToOrderx < ActiveRecord::Migration[5.2]
  def change
    add_reference :orderxes, :userx, foreign_key: true
  end
end
