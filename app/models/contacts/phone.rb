class Phone < Contact
  before_create :set_secondary_if_any_primary

  alias_attribute :number, :info1
  alias_attribute :area_code, :info2

  private

  def set_secondary_if_any_primary
    self.primary = false if parent.phones.any?(&:primary)
  end
end
