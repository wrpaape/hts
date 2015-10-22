class AboutUsImage < Image
  include PrimaryImage, HasClassPathFile

  self.file_extension = "jpg"
  self.class_path_file = "about_us/"
end