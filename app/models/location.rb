class Location < ActiveRecord::Base
  include Contactable
  
  belongs_to :company
  belongs_to :employee
end
