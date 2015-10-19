class Logo < Image
  include PrimaryImage

  before_create :prepend_company_name_to_class_name

  alias_attribute :slogan, :description

  self.file_extension = "png"
  self.desc_lambda = -> { slogan }

  private

  def prepend_company_name_to_class_name
    class_name.prepend("#{parent.name.underscore.tr("/_/","-")} ")
  end
end