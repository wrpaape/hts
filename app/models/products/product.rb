class Product < ActiveRecord::Base
  include HasCategory
  
  self.pool_fields = [:name, :category, :info]

  has_many :documents, as: :parent

  alias_attribute :display, :name

  private

  def self.load_descendants
    [Modification, CustomMetalProduct, EquipmentScreen, ExtendedGasSection, HighPerformanceAHU, LowProfileERV, MultiZoneVAV, VRVAccessory]
  end

  load_descendants.each { self.pool_fields -= [:category] }
end
