class Flat
  include Mongoid::Document
  
  belongs_to :floor
  
  field :name, type: String
end
