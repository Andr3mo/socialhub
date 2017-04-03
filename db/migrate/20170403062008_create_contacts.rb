class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :page_title
      t.text :map
      t.text :content
      t.text :address
      t.string :postal_code
      t.string :city
      t.string :province
      t.string :country
      t.string :phone
      t.string :email
      t.string :facebook
      t.string :twitter

      t.timestamps
    end
  end
end
