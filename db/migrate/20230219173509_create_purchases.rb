# frozen_string_literal: true

class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string 'content_type'
      t.integer 'content_id'
      t.integer 'user_id', null: false
      t.datetime 'expiration_date'
      t.references :purchase_option, null:false, foreign_key: true
      t.timestamps
    end
  end
end
