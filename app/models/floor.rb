class Floor
  include Mongoid::Document
  
  has_many :flats
  
  field :name, type: String
end
