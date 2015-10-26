class Address < Contact
  alias_attribute :line1, :info1
  alias_attribute :line2, :info2
  alias_attribute :line3, :info3
  alias_attribute :line4, :info4

  def display
    [line1, line2, line3, line4].compact.join("▓")
  end
end
