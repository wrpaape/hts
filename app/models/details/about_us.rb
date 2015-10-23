class AboutUs < Detail
  has_one :bg_image, -> { bg }, as: :parent, class_name: "AboutUsImage"
  has_many :fg_images, -> { fg }, as: :parent, class_name: "AboutUsImage"
  before_create :set_title

  private

  def set_title
    self.title = "About Us"
  end

  def self.component_props
    AboutUs.take.as_json(include: :fg_images)
  end
end