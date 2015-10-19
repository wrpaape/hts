module AddFilenameSuffix
  extend ActiveSupport::Concern

  included do
    class_attribute :file_extension

    before_create :set_filename_suffix

    private

    def set_filename_suffix
      filename << "#{self.class.to_s.underscore}.#{file_extension}"
    end
  end
end