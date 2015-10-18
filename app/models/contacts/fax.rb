class Fax < Contact
  include HasNumber

  # before_create :set_secondary_if_any_primary

  # def set_secondary_if_any_primary
  #   self.primary = false if parent.faxes.any?(&:primary)
  # end
end
