module HasTypeDisplay
  extend ActiveSupport::Concern

  included do
    class_attribute :class_type_display

    before_create :set_type_display

    private

    def set_type_display
      self.type_display = underscored.pluralize
    end
  end
end