class ActivityMaterial < EveDump
  set_table_name 'typeActivityMaterials'
  set_primary_keys :typeID, :activityID, :requiredTypeID

  belongs_to :activity, :foreign_key => :activityID, :class_name => 'Activity'
  belongs_to :producing, :foreign_key => :typeID, :class_name => "InventoryType"
  belongs_to :consuming, :foreign_key => :requiredTypeID, :class_name => "InventoryType"
end # class ActivityMaterial
