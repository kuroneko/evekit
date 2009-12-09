class Entity < ActiveRecord::Base
  belongs_to :user
  belongs_to :api_key
  validates_presence_of :name, :on => :create, :message => "can't be blank"
end
