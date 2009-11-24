class InventoryType < EveDump
  set_table_name 'invTypes'
  set_primary_key 'typeID'

  belongs_to :inventory_group, :class_name => "InventoryGroup", 
    :foreign_key => 'groupID'

  def to_s
    return self.typeName
  end
end
