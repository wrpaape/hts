module BaseClassMethods
  extend ActiveSupport::Concern

  included do
    private
    
    def self.underscored
      to_s.underscore
    end

    def self.dasherized
      underscored.dasherize
    end
  end
end