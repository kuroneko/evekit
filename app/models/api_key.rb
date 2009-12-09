class ApiKey < ActiveRecord::Base
  validates_presence_of :user_id, :on => :create, :message => "can't be blank"
  validates_presence_of :api_key, :on => :create, :message => "can't be blank"
  
  belongs_to :user
  
  def to_api
    return EAAL::API.new(self.eve_id, self.api_key)
  end
  
  def characters
    api = self.to_api
    charlist = api.Characters
    reslist = []
    charlist.characters.each do |char|
      charproxy = Character.find(:first, :conditions => {:eve_id => char.characterID})
      if nil == charproxy then
        charproxy = Character.new do |c|
          c.eve_id = char.characterID
          c.name = char.name
          c.save
        end
      end
      reslist << charproxy
    end
    return reslist
  end
end
