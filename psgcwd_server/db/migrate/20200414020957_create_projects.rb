class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :guid
      t.string :slug
      t.string :ptitle, :null => false
      t.string :psubtitle
      t.text :body
      t.string :client
      t.references :startdate, references: :monthperiods, foreign_key: { to_table: :monthperiods}
      t.references :enddate, references: :monthperiods, foreign_key: { to_table: :monthperiods}
      t.timestamps
    end
    add_index :projects, :guid, unique: true
    add_index :projects, :slug, unique: true
  end
end
