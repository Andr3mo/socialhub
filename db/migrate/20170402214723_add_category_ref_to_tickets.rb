class AddCategoryRefToTickets < ActiveRecord::Migration[5.0]
  def change
    add_reference :tickets, :category, foreign_key: true
  end
end
