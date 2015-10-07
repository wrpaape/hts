module SetKey
  extend ActiveSupport::Concern

  included do
    before_create :set_key
    
    private

    def set_key
      self.key = "#{self.class.to_s.underscore}-#{self.class.count}" unless key
    end
  end
end