class Product < Prod
  self.pool_fields -= [:type_display]
  set_attrs("products")

  private

  def self.load_other_categories
    [Modification, CMProduct, EquipScreen, ExtGasSec, HighPerfAHU, LowProfileERV, MultiZoneVAV, VRVAcc]
  end
end
