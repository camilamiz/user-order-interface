class DeleteColumnOrderx < ActiveRecord::Migration[5.2]
  def change
    remove_column :orderxes, :user_id
  end
end
