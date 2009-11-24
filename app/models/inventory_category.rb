class InventoryCategory < EveDump
  set_table_name "invCategories"
  set_primary_key "categoryID"

  has_many :inventory_groups, :class_name => "InventoryGroup", 
        :foreign_key => 'categoryID'

  def to_s
    return self.categoryName
  end
end
