class CreateBrains < ActiveRecord::Migration[7.1]
  def change
    create_table :brains do |t|
      t.string :name
      t.integer :qi
      t.text :languages, array: true, default: []
      t.text :specialties, array: true, default: []
      t.integer :price_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
