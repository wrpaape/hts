class Contact < ActiveRecord::Base
  belongs_to :parent, polymorphic: true

  scope :by_priority, -> { order(primary: :desc) }
  scope :primary, -> { where(primary: true) }

  private

  def set_secondary_if_any_primary
    contact_type = Contact.subclasses.select { |model| is_a?(model) }
    update(primary: false) if parent.contacts.where(type: contact_type).any?(&:primary)
  end
end
