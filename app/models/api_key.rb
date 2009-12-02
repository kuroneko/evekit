class ApiKey < ActiveRecord::Base
  validates_presence_of :user_id, :on => :create, :message => "can't be blank"
  validates_presence_of :api_key, :on => :create, :message => "can't be blank"
  
  def to_reve
    return Recache::API.new(self.user_id, self.api_key)
  end
  
  def characters
    api = self.to_reve
    charlist = api.characters()
    reslist = []
    charlist.each do |char|
      charproxy = Character.find(:first, :conditions => {:eve_id => char.id})
      if nil == charproxy then
        charproxy = Character.new do |c|
          c.eve_id = char.id
          c.name = char.name
          c.save
        end
      end
      reslist << charproxy
    end
    return reslist
  end
end
