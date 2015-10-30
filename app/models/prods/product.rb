class Product < Prod
  self.pool_fields -= [:type_display]
  set_attrs("products")
end
