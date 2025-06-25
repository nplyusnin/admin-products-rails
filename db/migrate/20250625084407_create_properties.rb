class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :properties do |t|
      t.references :property_list, null: false, foreign_key: true
      t.integer :position
      t.string :title
      t.string :value

      t.timestamps
    end
  end
end
