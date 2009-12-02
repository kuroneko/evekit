class EveGroup < EveDb
  set_table_name "invGroups"
  set_primary_key "groupID"

  has_many :inventory_types, :class_name => "EveType", 
        :foreign_key => 'groupID'
  belongs_to :inventory_category, :class_name => "EveCategory",
        :foreign_key => 'categoryID'

  def to_s
    return self.groupName
  end
end
