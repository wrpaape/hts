class Contact < ActiveRecord::Base
  belongs_to :parent, polymorphic: true

  private

  def set_secondary_if_any_primary
    contact_type = Contact.subclasses.select { |model| is_a?(model) }
    update(primary: false) if parent.contacts.where(type: contact_type).any?(&:primary)
  end
end
