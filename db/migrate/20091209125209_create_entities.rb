class CreateEntities < ActiveRecord::Migration
  def self.up
    create_table :entities do |t|
      t.integer :user_id, :null => false
      t.integer :api_key_id, :null => false
      t.string :type, :null => false, :default => 'character'
      t.string :name
      t.timestamp :last_poll, :null => true
      t.timestamps
    end
  end

  def self.down
    drop_table :entities
  end
end
