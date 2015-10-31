class Product < Prod
  self.pool_fields -= [:type_display]

  private

  def self.load_descendants
    [Modification, CMProduct, EquipmentScreen, ExtendedGasSection, HighPerformanceAHU, LowProfileERV, MultiZoneVAV, VRVAccessory]
  end
end
