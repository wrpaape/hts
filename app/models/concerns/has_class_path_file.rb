module HasClassPathFile
  extend ActiveSupport::Concern

  included do
    class_attribute :class_path_file

    before_save :set_path_file

    private

    def set_path_file
      self.path_file = class_path_file
    end
  end
end
