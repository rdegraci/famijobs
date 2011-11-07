class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title
      t.text :description
      t.float :rate
      t.references :user
      t.boolean :open

      t.timestamps
    end
  end
end
