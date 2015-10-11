class Good < Product
  before_create :set_category, unless: :category

  def all_main_index
    nil
  end

  private

  def set_category
    self.category = "products"
  end
end
