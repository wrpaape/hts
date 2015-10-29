class Drawing < Document
  self.pool_fields -= [:type_display]
  set_attrs("drawings")
end