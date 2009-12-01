class Faction < EveDump
  set_table_name 'chrFactions'
  set_primary_key :factionID
  
  has_many :contraband_types, :foreign_key => :factionID,
    :class => "InventoryContrabandType" 

  def to_s
    return self.factionName
  end
end # class
