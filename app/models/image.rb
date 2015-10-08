class Image < Asset
  before_create :set_default, unless: :default

  private

  def set_default
    regex =
    case parent_type
      when "Product", "Spec" then /(?<=\/).*/
      else /[^\/]+\/$/
    end
    
    self.default = path.sub(regex, "default.png")
  end
end
