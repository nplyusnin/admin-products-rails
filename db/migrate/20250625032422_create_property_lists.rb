class CreatePropertyLists < ActiveRecord::Migration[8.0]
  def change
    create_table :property_lists do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :position
      t.string :title

      t.timestamps
    end
  end
end
