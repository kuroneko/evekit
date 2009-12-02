class EveActivity < EveDb
  set_table_name 'ramActivities'
  set_primary_keys :activityID
  
  def to_s
    return self.activityName
  end
end  