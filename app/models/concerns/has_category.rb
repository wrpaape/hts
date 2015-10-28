module HasCategory
  extend ActiveSupport::Concern

  included do
    class_attribute :category

    alias_attribute :path, :path_show

    private 
    
    def self.component_props
      keys = [:key, :path, :display]
      pluck(*keys).map { |values| Hash[keys.zip(values)] }
    end

    def set_type_display
      self.type_display = category.titleize(exclude: %w(and))
    end

    def add_path
      update(path_show: send("#{type_display.fileize.singularize}_path(#{id})"))
    end
  end
end