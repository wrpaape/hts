class Company < ActiveRecord::Base
  include Contactable, AddImage

  has_many :locations
  has_many :employees, through: :locations

  alias_attribute :logo, :image

  self.image_type = Logo

  private

  def self.contact_component_props
    opts = [
    {
      phone: {
        only: :key,
        methods: [:area_code, :number]
      }
    },
    {
      fax: {
        only: :key,
        methods: [:area_code, :number]
      }
    },
    {
      email: {
        only: :key,
        methods: :address
      }
    }]

    contact_json(all, opts)
  end
end
