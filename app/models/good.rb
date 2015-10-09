class Good < Product
  before_create :set_category, unless: :category

  private

  def set_category
    self.category = "products"
  end
end
