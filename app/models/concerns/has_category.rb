module HasCategory
  extend ActiveSupport::Concern

  included do
    include HasAllAssets, Searchable, AddPath

    class_attribute :category, :controller
    self.category = to_s.titleize(exclude: %w(and)).pluralize
    self.controller = to_s.pluralize.to_sym

    private

    def self.path_index
      new.send("#{tableized}_path")
    end

    def self.nav_btn_props
      {
        key: dasherized,
        path: path_index,
        display: category
      }
    end

    def self.nav_btns_props
      nav_btn_props.merge({
        key_head: "#{dasherized}-index",
        nav_btns: descendants.map(&:nav_btn_props)
      })
    end
  end
end