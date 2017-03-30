class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.string :code
      t.decimal :price
      t.integer :stock_quantity
      t.string :status

      t.timestamps
    end
  end
end
