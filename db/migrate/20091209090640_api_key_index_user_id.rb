class ApiKeyIndexUserId < ActiveRecord::Migration
  def self.up
  	add_index :api_keys, :user_id, { :unique => false }
  end

  def self.down
  	remove_index :api_keys, :user_id
  end
end
