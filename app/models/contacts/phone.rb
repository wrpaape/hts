class Phone < Contact
  include HasNumber
  
  # before_create :set_secondary_if_any_primary

  # private

  # def set_secondary_if_any_primary
  #   self.primary = false if parent.phones.any?(&:primary)
  # end
end
