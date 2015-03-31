class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.text :description
      t.string :permission, default: 'private'

      t.timestamps null: false
    end
  end
end
