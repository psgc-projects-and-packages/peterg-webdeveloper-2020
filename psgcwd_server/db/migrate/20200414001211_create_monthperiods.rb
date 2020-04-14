class CreateMonthperiods < ActiveRecord::Migration[6.0]
  def change
    create_table :monthperiods do |t|
      t.string :guid, :null => true
      t.string :slug, :null => true
      t.string :period_year, :null => false
      t.integer :month_number, :unsigned => true, :null => false
      t.date :start_date, :null => false
      t.date :end_date, :null => false
      t.timestamps
    end
    add_index :monthperiods, :guid, unique: true
    add_index :monthperiods, :slug, unique: true
  end
end
