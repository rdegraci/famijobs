class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :lastname
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone
      t.references :user
      t.boolean :available

      t.timestamps
    end
  end
end
