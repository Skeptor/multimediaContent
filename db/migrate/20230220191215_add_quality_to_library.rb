# frozen_string_literal: true

class AddQualityToPurchase < ActiveRecord::Migration[7.0]
  def change
    add_column :libraries, :video_quality, :integer
  end
end
