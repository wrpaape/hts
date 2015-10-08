class Image < Asset
  before_create :set_default, unless: :default

  private

  def set_default
    self.default =
    case parent_type
      when "Product", "Spec"
        path.sub(/(?<=\/).*/, "default.png")
      else
        path.sub(/[^\/]+\/$/, "default.png")
    end
  end
end
