module AddPath
  extend ActiveSupport::Concern

  included do    
    after_create :add_path

    private 

    def add_path
      update(path_show: send("#{underscored}_path", id))
    end
  end
end