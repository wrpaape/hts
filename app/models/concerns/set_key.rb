module SetKey
  extend ActiveSupport::Concern

  included do
    before_create :set_key
    
    private

    def set_key
      self.key = name unless key
    end
  end
end