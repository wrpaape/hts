class Product < ActiveRecord::Base
  include HasCategory

  has_many :documents, as: :parent

  alias_attribute :display, :name

  self.pool_fields = [:name, :type_display, :info]

  private

  def self.load_descendants
    [Modification, CMProduct, EquipmentScreen, ExtendedGasSection, HighPerformanceAHU, LowProfileERV, MultiZoneVAV, VRVAccessory]
  end
  
  load_descendants.each { self.pool_fields -= [:type_display] }
end
