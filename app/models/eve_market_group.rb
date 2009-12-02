class EveMarketGroup < EveDb
  set_table_name "invMarketGroups"
  set_primary_key "marketGroupID"

  acts_as_tree :foreign_key => 'parentGroupID'

  has_many :inventory_types, :class_name => "EveType", 
        :foreign_key => 'marketGroupID'

  
  # things are a little odd - the tree has no actual root node, but instead,
  # a series of root branches.
  #
  # the root method shall return all such nodes.
  def self.root
    return self.find(:all, :conditions => { :parentGroupID => nil })
  end

  def to_s
    return self.marketGroupName
  end
end
