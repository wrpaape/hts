module AddImage
  extend ActiveSupport::Concern

  included do
    after_create :add_image

    private

    def add_image
      Image.create(parent_id: id, parent_type: self.class.to_s, filename: image_type)
    end
  end
end