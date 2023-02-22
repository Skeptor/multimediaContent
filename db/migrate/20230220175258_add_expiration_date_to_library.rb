# frozen_string_literal: true

class AddExpirationDateToPurchase < ActiveRecord::Migration[7.0]
  def change
    add_column :libraries, :expiration_date, :datetime
  end
end
