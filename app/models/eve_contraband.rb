class EveDump::Contraband < EveDump::Db
  set_table_name 'invContrabandTypes'
  set_primary_keys :factionID, :typeID

  belongs_to :faction, :foreign_key => :factionID
  belongs_to :inventory_type, :foreign_key => :typeID, 
    :class_name => "EveDump::Type"
end
