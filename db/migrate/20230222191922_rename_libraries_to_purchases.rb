class RenameLibrariesToPurchases < ActiveRecord::Migration[7.0]
  def change
    rename_table :libraries, :purchases
  end
end
