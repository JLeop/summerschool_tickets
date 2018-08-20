class AddTaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ta, :boolean
  end
end
