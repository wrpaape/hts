class HeadShot < Image
  include PrimaryImage, HasCaption

  alias_attribute :name_and_title, :description

  self.file_extension = "jpg"
  self.desc_lambda = -> { "#{name} (#{job_title})" }
end