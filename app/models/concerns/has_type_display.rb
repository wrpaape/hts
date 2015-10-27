module HasTypeDisplay
  extend ActiveSupport::Concern

  included do
    before_create :set_type_display

    private

    def set_type_display
      self.type_display = self.class.to_s.underscore.dasherize
    end
  end
end