module HasTypeDisplay
  extend ActiveSupport::Concern

  included do
    class_attribute :type_display

    before_create :set_type_display

    private

    def set_type_display
      self.type_display = type_display
    end
  end
end