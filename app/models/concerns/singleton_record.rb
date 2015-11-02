module SingletonRecord
  extend ActiveSupport::Concern

  included do
    before_create :set_label, :set_path
    validate :one_of_a_kind


    private

    def set_label
      self.name = model.category
    end

    def set_path
      model.class_exec do
        return unless include?(HasCategory)
        alias_attribute :path_index, :path_show
      end
      self.path_index = model.path_index
    end

    def one_of_a_kind
      errors.add(:base, "exceeded #{model} limit") if model.count > 0
    end
  end
end