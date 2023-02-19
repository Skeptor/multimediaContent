class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string "content_type"
      t.integer "content_id"
      t.integer "user_id", null: false
      t.timestamps
    end

    add_index :same_type_of_content, [:content_id, :content_type], unique: true
  end
end
