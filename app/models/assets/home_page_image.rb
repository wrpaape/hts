class HomePageImage < Image
  around_save :set_path_file
  before_create :set_class_name

  alias_attribute :title, :description

  private

  def set_path_file
    self.path_file = "/home_page/"
  end

  def set_path_file
    self.set_class_name = "home-page image"
  end 
end