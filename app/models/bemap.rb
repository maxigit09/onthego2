class Bemap < ActiveRecord::Base
  has_attached_file :atch ,
  :path => ":rails_root/public/:class/:id/:style/:basename.:extension",
  :url => "/:class/:id/:style/:basename.:extension"
  has_many :characters
end
  #:path => ":rails_root/public/:class/:attachment/:id/:style_:basename.:extension",
