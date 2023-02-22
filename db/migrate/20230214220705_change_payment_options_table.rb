# frozen_string_literal: true

class ChangePaymentOptionsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :purchase_options

    create_table :purchase_options do |t|
      t.float :price, default: 2.99
      t.integer :video_quality
      t.references :payment, polymorphic: true
      t.timestamps
    end
  end
end
