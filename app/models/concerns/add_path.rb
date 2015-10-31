module AddPath
  extend ActiveSupport::Concern
  include Rails.application.routes.url_helpers

  included do    
    after_create :add_path

    private 

    def add_path
      update(path_show: send("#{model.underscored}_path", id))
    end
  end
end