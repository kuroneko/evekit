class DeleteRecacheStores < ActiveRecord::Migration
  def self.down
    create_table :recache_stores do |t|
      t.string :request_hash
      t.text :data
      t.datetime :cached_until
    end
    add_index :recache_stores, :request_hash
  end

  def self.up
    drop_table :recache_stores
  end
end
