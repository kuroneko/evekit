class EveDump::Group < EveDump
  set_table_name "invGroups"
  set_primary_key "groupID"

  has_many :inventory_types, :class_name => "EveDump::Type", 
        :foreign_key => 'groupID'
  belongs_to :inventory_category, :class_name => "EveDump::Category",
        :foreign_key => 'categoryID'

  def to_s
    return self.groupName
  end
end
