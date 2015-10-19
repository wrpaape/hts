class HomePageImage < Image
  include PrimaryImage
  
  before_save :set_path_file

  alias_attribute :caption, :description

  self.file_extension = "png"
  self.desc_lambda = -> { name }

  private

  def set_path_file
    self.path_file = "/home_page/"
  end
end