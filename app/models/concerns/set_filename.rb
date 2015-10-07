module SetFilename
  extend ActiveSupport::Concern

  included do
    before_create :set_filename
    
    private

    def set_filename
      self.filename = name ? name.downcase.sub(" ", "_") : "default" unless filename
    end
  end
end