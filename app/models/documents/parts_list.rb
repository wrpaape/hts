class PartsList < Document
  self.pool_fields -= [:type_display]
  set_attrs("parts_lists")
end