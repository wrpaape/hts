class Mod < Product
  self.category = "modifications"
  self.pool_fields -= [:category]
end
