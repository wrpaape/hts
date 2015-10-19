module AddImage
  extend ActiveSupport::Concern

  included do
    class_attribute :image_type

    after_create :add_image

    private

    def add_image
      image_type.create(parent_id: id, parent_type: self.class.to_s)
    end
  end
end