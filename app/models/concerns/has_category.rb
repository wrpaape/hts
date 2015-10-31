module HasCategory
  extend ActiveSupport::Concern
  include Rails.application.routes.url_helpers

  included do
    include AddPath, HasAllAssets, Searchable, HasTypeDisplay

    class_attribute :underscored, :dasherized, :category, :controller, :path_index
    self.underscored = to_s.underscore
    self.dasherized = to_s.dasherize
    self.category = to_s.titleize(exclude: %w(and)).pluralize
    self.controller = to_s.pluralize.to_sym
    # self.path_index = send("#{underscored.pluralize}_path")

    private

    def add_path
      update(path_show: send("#{underscored}_path", id))
    end

    def self.nav_btn_props
      {
        key: dasherized,
        path: path_index,
        display: category
      }
    end

    def self.nav_btns_props
      {
        key: dasherized,
        key_head: "#{dasherized}-index",
        path: path_index,
        display: category,
        nav_btns: load_categories.map(&:nav_btn_props)
      }
    end
  end
end