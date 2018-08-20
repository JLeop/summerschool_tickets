class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :status, default: "pending"
      t.text :question
      t.references :student
      t.references :ta

      t.timestamps
    end
  end
end
