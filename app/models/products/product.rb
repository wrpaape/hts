class Good < ActiveRecord::Base
  include HasCategory

  has_many :documents, as: :parent

  alias_attribute :display, :name

  self.pool_fields = [:name, :type_display, :info]
  set_attrs("goods")

  private

  def self.load_descendants
    [Good, Mod, CMProduct, EquipScreen, ExtGasSec, HighPerfAHU, LowProfileERV, MultiZoneVAV, VRVAcc]
  end
end
