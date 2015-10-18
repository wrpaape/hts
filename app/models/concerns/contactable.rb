module Contactable
  extend ActiveSupport::Concern

  included do
    has_many :contacts, as: :parent
    has_many :phones, as: :parent
    has_many :faxes, as: :parent
    has_many :emails, as: :parent
    has_many :primary_contacts, -> { where(primary: true) }, as: :parent, class_name: "Contact"
    has_one :primary_phone, ->(phones) { where(primary: true) }, as: :parent, class_name: "Phone"
    has_one :primary_fax, ->(phones) { where(primary: true) }, as: :parent, class_name: "Fax"
    has_one :primary_email,->(emails) { where(primary: true) }, as: :parent, class_name: "Email"
  end
end