class Good < Product
  def all_main_index
    nil
  end

  private

  def set_category
    self.category = "products"
  end
end
