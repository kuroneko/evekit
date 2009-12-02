class Character < ActiveRecord::Base
  validates_presence_of :eve_id, :on => :create, :message => "can't be blank"
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :eve_id, :on => :create, :message => "must be unique"
end
