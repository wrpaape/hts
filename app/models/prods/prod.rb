class Prod < ActiveRecord::Base
  include HasCategory

  has_many :docs, as: :parent

  alias_attribute :display, :name

  self.pool_fields = [:name, :type_display, :info]
  set_attrs("prods")

  private

  def self.load_descendants
    [Good, Mod, CMProduct, EquipScreen, ExtGasSec, HighPerfAHU, LowProfileERV, MultiZoneVAV, VRVAcc]
  end
end
