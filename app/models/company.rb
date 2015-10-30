class Company < ActiveRecord::Base
  include Contactable, AddImage

  has_many :locations
  has_many :employees, through: :locations
  has_many :addresses, -> { by_priority }, as: :parent
  has_one :phone, ->(phones) { primary }, as: :parent
  has_one :address, ->(addresses) { primary }, as: :parent

  alias_attribute :logo, :image

  self.image_type = Logo

  def name_display
    name
  end

  private 

  def set_type_display
    self.type_display = "#{class_type_display} #{name.fileize.dasherize}"
  end
end
