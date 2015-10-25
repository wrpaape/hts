module Contactable
  extend ActiveSupport::Concern

  included do
    has_many :contacts, -> { order(primary: :desc) }, as: :parent, before_add: :set_secondary_if_any_primary
    has_many :phones, -> { order(primary: :desc) }, as: :parent
    has_many :faxes, -> { order(primary: :desc) }, as: :parent
    has_many :emails, -> { order(primary: :desc) }, as: :parent
    has_many :primary_contacts, -> { where(primary: true) }, as: :parent, class_name: "Contact"
    has_one :primary_phone, ->(phones) { where(primary: true) }, as: :parent, class_name: "Phone"
    has_one :primary_fax, ->(phones) { where(primary: true) }, as: :parent, class_name: "Fax"
    has_one :primary_email,->(emails) { where(primary: true) }, as: :parent, class_name: "Email"

    private

    def set_secondary_if_any_primary(contact)
      conflict_type = Contact.subclasses.find { |child| contact.is_a?(child) }
      contact.update(primary: false) if contacts.select { |con| con.is_a?(conflict_type) }.any?(&:primary)
    end

    def self.contact_component_props
      all.as_json(only: [:key, :title, :path_show], include: [
        {
          primary_phone: {
            only: :key,
            methods: [:area_code, :number, :extension]
          }
        },
        {
          primary_fax: {
            only: :key,
            methods: [:area_code, :number]
          }
        },
        {
          primary_email: {
            only: :key,
            methods: :address
          }
        },
        Hash[image_type.to_s.fileize.to_sym, {
          only: [:key, :class_name, :filename, :path_file, :path_default, :path_link],
          methods: image_type == Logo ? :slogan : :name_and_title
        }]
      ], methods: :name)
    end
  end
end