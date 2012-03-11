class CreateUserCountries < ActiveRecord::Migration
  def self.up
    create_table :user_countries do |t|
      t.integer :user_id, :null => false, :default => 0
      t.string :country_id, :null => false, :default => ''
      t.string :currency_id, :null => false, :default => ''
      t.boolean :visited, :null => false, :default => false
      t.timestamps
    end
    add_index :user_countries, :user_id
  end

  def self.down
    drop_table :user_countries
  end
end
