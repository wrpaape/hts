class Document < Doc
  self.pool_fields -= [:type_display]
  set_attrs("documents")

  private

  def self.load_other_categories
    [Catalog, Drawing, InstallManual, PartsList]
  end
end