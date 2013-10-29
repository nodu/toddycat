class School
  include Mongoid::Document
  
  embedded_in :user
  
  field :id, type: String
  
  field :name, type: String
  field :address, type: Array
  
  field :began_on, type: Date
  field :ended_on, type: Date
  
  field :major, type: String
  field :did_graduate, type: Boolean, default: false
  
end