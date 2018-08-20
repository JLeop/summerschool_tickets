class AddTicketsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :ticket, foreign_key: true
  end
end
