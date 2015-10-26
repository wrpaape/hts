class OfficePhone < Phone
  alias_attribute :extension, :info3

  self.display_type = "office"
end

