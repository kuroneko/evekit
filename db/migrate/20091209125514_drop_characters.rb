class DropCharacters < ActiveRecord::Migration
  def self.up
    drop_table :characters
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
