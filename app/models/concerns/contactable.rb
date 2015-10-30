module Contactable
  extend ActiveSupport::Concern

  included do
    include HasTypeDisplay

    has_many :contacts, -> { by_display }, as: :parent, before_add: :set_secondary_if_any_primary
    has_many :phones, -> { by_priority }, as: :parent
    has_many :faxes, -> { by_priority }, as: :parent
    has_many :emails, -> { by_priority }, as: :parent
    has_one :fax, ->(faxes) { primary }, as: :parent
    has_one :email, ->(emails) { primary }, as: :parent

    self.class_type_display = to_s.underscore.dasherize

    private

    def set_secondary_if_any_primary(contact)
      conflict_type = Contact.subclasses.find { |child| contact.is_a?(child) }
      contact.update(primary: false) if contacts.select { |con| con.is_a?(conflict_type) }.any?(&:primary)
    end

    def self.contact_content_props
      includes(:contacts, :image).as_json(only: [:key, :type_display, :path_show], include: [
        {
          contacts: {
            only: [:key, :type_display],
            methods: :info_display
          }
        },
        {
          image: {
            only: [:key, :class_name, :filename, :path_file, :path_default, :path_link]
          }
        }
      ], methods: :name_display)
    end
  end
end