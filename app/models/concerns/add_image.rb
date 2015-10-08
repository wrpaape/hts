module AddImage
  extend ActiveSupport::Concern

  included do
    private

    def add_image(filename)
      Image.create(parent_id: id, parent_type: self.class.to_s, filename: filename)
    end
  end
end