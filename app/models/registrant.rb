class Registrant
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :id, type: String
  field :email, type: String
  field :expires_at, type: Time
  
  before_save :set_expiration
  
  private
  
  def set_expiration
    self.expires_at = Time.now + 4.hours
  end
end