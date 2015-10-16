class Good < Product
  self.category = "products"
  self.pool_fields -= [:category]
end
