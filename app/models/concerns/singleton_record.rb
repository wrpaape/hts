module SingletonRecord
  extend ActiveSupport::Concern

  included do
    before_create :set_label
    validate :one_of_a_kind

    private

    def set_label
      # self.name = category if is_a?(Product) 
      self.name = category
    end

    def one_of_a_kind
      errors.add(:base, "Exceeded thing limit") if self.class.count > 0
    end
  end
end