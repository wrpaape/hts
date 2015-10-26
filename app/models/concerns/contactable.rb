module Contactable
  extend ActiveSupport::Concern

  included do
    has_many :contacts, -> { by_priority }, as: :parent, before_add: :set_secondary_if_any_primary
    has_many :phones, -> { by_priority }, as: :parent
    has_many :faxes, -> { by_priority }, as: :parent
    has_many :emails, -> { by_priority }, as: :parent
    has_one :phone, ->(phones) { primary }, as: :parent
    has_one :fax, ->(faxes) { primary }, as: :parent
    has_one :email, ->(emails) { primary }, as: :parent

    private

    def set_secondary_if_any_primary(contact)
      conflict_type = Contact.subclasses.find { |child| contact.is_a?(child) }
      contact.update(primary: false) if contacts.select { |con| con.is_a?(conflict_type) }.any?(&:primary)
    end

    def self.contact_json(contactable)
      contactable.as_json(only: [:key, :title, :path_show], include: [
        {
          phones: {
            only: :key,
            methods: [:type, :area_code, :number, :extension]
          }
        },
        {
          faxes: {
            only: :key,
            methods: [:area_code, :number]
          }
        },
        {
          emails: {
            only: :key,
            methods: :address
          }
        },
        {
          image: {
            only: [:key, :class_name, :filename, :path_file, :path_default, :path_link]
          }
        }
      ], methods: :name)
    end
  end
end