class Product < Product
  self.pool_fields -= [:type_display]
  set_attrs("products")
end
