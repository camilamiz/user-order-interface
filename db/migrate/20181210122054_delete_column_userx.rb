class DeleteColumnUserx < ActiveRecord::Migration[5.2]
  def change
    remove_column :userxes, :orderx_id
  end
end
