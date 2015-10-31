module AddImage
  extend ActiveSupport::Concern

  included do
    class_attribute :image_type

    after_create :add_image

    has_one :image, as: :parent

    private

    def add_image
      image_type.create(parent_id: id, parent_type: model.to_s)
    end
  end
end