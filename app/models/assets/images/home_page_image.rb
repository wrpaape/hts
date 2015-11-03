class HomePageImage < Image
  include PrimaryImage, HasClassPathFile

  before_save :set_path_file

  alias_attribute :caption, :description

  self.file_extension = "png"
  self.desc_lambda = -> { name }
  self.class_path_file = "home_page/"
end