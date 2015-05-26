class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :slug
      t.text :url

      t.timestamps null: false
    end
    add_index :urls, :slug, :unique => true
  end
end
