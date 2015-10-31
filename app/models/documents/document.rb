class Document < ActiveRecord::Base
  include HasCategory

  belongs_to :parent, polymorphic: true

  # alias_attribute :display, :title

  self.pool_fields = [:title, :category, :body]

  private

  def self.load_descendants
    [Catalog, Drawing, InstallationManual, PartsList]
  end

  load_descendants.each { self.pool_fields -= [:category] }
end