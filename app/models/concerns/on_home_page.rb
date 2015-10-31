module OnHomePage
  extend ActiveSupport::Concern

  included do

    private

    def self.add_index_model
      image_type.create(parent_id: id, parent_type: self.class.to_s)
    end
  end
end