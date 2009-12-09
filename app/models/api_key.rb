class ApiKey < ActiveRecord::Base
  validates_presence_of :user_id, :on => :create, :message => "can't be blank"
  validates_presence_of :api_key, :on => :create, :message => "can't be blank"
  
  belongs_to :user
  has_many :entities
  
  def to_api
    return EAAL::API.new(self.eve_id, self.api_key)
  end
  
  def poll_entities
    ent_list = self.entities
    api = self.to_api
    acct_chars = api.Characters.characters
    
    acct_chars.each { |e|
      if not ent_list.map { |m| m.eve_id }.include?(e.characterID)
        newent = Character.new do |c|
          c.user = self.user
          c.api_key = self
          c.name = e.name
          c.save!
        end
      end
    }
    ent_list.each { |e|
      if not acct_chars.map { |m| m.characterID }.include?(e.eve_id)
        e.destroy
      end
    }
  end
end
