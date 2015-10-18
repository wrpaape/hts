class Email < Contact
  # before_create :set_secondary_if_any_primary

  alias_attribute :address, :info1

  # private

  # def set_secondary_if_any_primary
  #   self.primary = false if parent.emails.any?(&:primary)
  # end
end
