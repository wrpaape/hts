class PartsList < Doc
  self.pool_fields -= [:type_display]
  set_attrs("parts_lists")
end