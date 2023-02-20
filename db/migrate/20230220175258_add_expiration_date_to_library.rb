class AddExpirationDateToLibrary < ActiveRecord::Migration[7.0]
  def change
    add_column :libraries, :expiration_date, :datetime
  end
end
