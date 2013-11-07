class Floor
  include Mongoid::Document
  
  has_many :flats
  accepts_nested_attributes_for :flats, :allow_destroy => true
  #when save floor, please save the flats too :D
  
  #include this to not save the blank fields.
  # :reject_if => proc { |attributes| :all_blank, 
  
  field :name, type: String
end
