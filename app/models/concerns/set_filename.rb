module SetFilename
  extend ActiveSupport::Concern

  included do
    before_create :set_filename
    
    private

    def set_filename
      self.filename = name.downcase.sub(" ", "_") unless filename
    end
  end
end