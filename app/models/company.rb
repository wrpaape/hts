class Company < ActiveRecord::Base
  include Contactable, AddImage

  has_many :locations
  has_many :employees, through: :locations
  has_one :phone, ->(phones) { primary }, as: :parent

  alias_attribute :logo, :image

  self.image_type = Logo

  private

  def self.contact_component_props
    contact_json
  end
end
