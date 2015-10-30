module HasCategory
  extend ActiveSupport::Concern
  include Rails.application.routes.url_helpers

  included do
    include AddPath, HasAllAssets, Searchable, HasTypeDisplay

    class_attribute :category
    class_attribute :path_index

    private

    def add_path
      update(path_show: send("#{category.singularize}_path", id))
    end

    def self.nav_btn_props
      {
        key: category,
        path: path_index,
        display: type_display
      }
    end

    def self.nav_btns_props
      {
        key: category,
        key_head: "#{category}-index",
        path: path_index,
        display: type_display,
        nav_btns: load_descendants.map(&:nav_btn_props)
      }
    end

    def self.set_attrs(category)
      self.category = category
      self.type_display = category.titleize(exclude: %w(and))
      self.path_index = new.send("#{category}_path")
    end
  end
end