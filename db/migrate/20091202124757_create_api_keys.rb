class CreateApiKeys < ActiveRecord::Migration
  def self.up
    create_table :api_keys do |t|
      t.integer   :user_id, :null => false
      t.integer   :eve_id, :null => false
      t.string    :api_key, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :api_keys
  end
end
