# frozen_string_literal: true

class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string 'content_type'
      t.integer 'content_id'
      t.integer 'user_id', null: false
      t.timestamps
    end
  end
end
