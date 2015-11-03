class Logo < Image
  include PrimaryImage, HasCaption

  before_create :prepend_company_name_to_class_name

  alias_attribute :slogan, :description

  self.file_extension = "png"
  self.desc_lambda = -> { slogan }

  private

  def set_path_file(steps)
    self.path_file = steps + "#{parent.name.fileize}/"
  end

  def prepend_company_name_to_class_name
    class_name.prepend("#{parent.name.fileize.dasherize} ")
  end
end