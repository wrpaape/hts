module PrimaryImage
  extend ActiveSupport::Concern

  included do
    class_attribute :file_extension, :desc_lambda
    
    before_create :set_filename_suffix, :set_description, :set_path_show

    alias_attribute :path_show, :path_link

    private

    def set_filename_suffix
      filename << "#{self.class.to_s.fileize}.#{file_extension}"
    end

    def set_description
      self.description = parent.instance_exec(&desc_lambda) unless description
    end

    def set_path_show
      self.path_show = parent.try(:path_show) unless path_link
    end
  end
end