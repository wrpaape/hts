class AboutUs < Text
  include HasAllAssets, SingletonRecord
  
  has_one :bg_image, -> { bg }, as: :parent, class_name: "AboutUsImage"
  has_many :fg_images, -> { fg }, as: :parent, class_name: "AboutUsImage"
  
  private

  def set_label
    self.title = "About Us"
  end

  def self.component_props
    take.as_json(only: [:key, :title, :body], include: {
      fg_images: {
        only: [:key, :class_name, :filename, :path_file, :path_default, :path_link]
      }
    })
  end
end