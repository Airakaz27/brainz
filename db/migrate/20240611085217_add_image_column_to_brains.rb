class AddImageColumnToBrains < ActiveRecord::Migration[7.1]
  def change
    add_column :brains, :image, :string
  end
end
