class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :guid
      t.string :slug
      t.string :ptitle
      t.string :psubtitle
      t.text :body
      t.string :client
      t.integer :startdate_id
      t.integer :enddate_id

      t.timestamps
    end
    add_index :projects, :guid, unique: true
    add_index :projects, :slug, unique: true
  end
end
