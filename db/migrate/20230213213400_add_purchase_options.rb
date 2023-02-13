class AddPurchaseOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_options do |t|
      t.float :price, default: 2.99
      t.integer :video_quality
      t.timestamps
    end

    add_reference :movies, :purchase_options
    add_reference :seasons, :purchase_options
  end
end
