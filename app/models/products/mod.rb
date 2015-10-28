class Mod < Product
  self.category = "modifications"
  self.pool_fields -= [:type_display]
end
