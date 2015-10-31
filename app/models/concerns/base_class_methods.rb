module BaseClassMethods
  extend ActiveSupport::Concern

  included do
    private

    def model
      self.class
    end
    def self.fileized
      to_s.fileize
    end

    def self.underscored
      to_s.underscore
    end

    def self.dasherized
      underscored.dasherize
    end
    
    def self.tableized
      underscored.pluralize.to_sym
    end
  end
end