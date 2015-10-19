module PrimaryImage
  extend ActiveSupport::Concern

  included do
    include AddFilenameSuffix, AddDescription

    before_create :set_path_show

    alias_attribute :path_show, :path_link

    private

    def set_path_show
      self.path_show = parent.path_show
    end
  end
end