class Document < ActiveRecord::Base
  include HasCategory

  belongs_to :parent, polymorphic: true

  # alias_attribute :display, :title

  self.pool_fields = [:title, :type_display, :body]

  private

  def self.load_descendants
    [Catalog, Drawing, InstallManual, PartsList]
  end

  load_descendants.each { self.pool_fields -= [:type_display] }
end