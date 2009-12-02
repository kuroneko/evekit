class EveDump::Faction < EveDump::Db
  set_table_name 'chrFactions'
  set_primary_key :factionID
  
  has_many :contraband_types, :foreign_key => :factionID,
    :class => "EveDump::Contraband" 

  def to_s
    return self.factionName
  end
end # class
