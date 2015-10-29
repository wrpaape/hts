class Catalog < Document
  self.pool_fields -= [:type_display]
  set_attrs("catalogs")
end