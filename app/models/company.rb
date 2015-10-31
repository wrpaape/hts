class Company < ActiveRecord::Base
  include Contactable, AddImage

  has_many :addresses, -> { by_priority }, as: :parent
  has_one :phone, ->(phones) { primary }, as: :parent
  has_one :address, ->(addresses) { primary }, as: :parent

  alias_attribute :logo, :image

  self.image_type = Logo

  def name_display
    name
  end

  private 

  def set_class_name
    self.class_name = "#{model.dasherized} #{name.underscore.dasherize}"
  end
end
