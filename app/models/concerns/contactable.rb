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
  end
end