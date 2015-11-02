module HasCategory
  extend ActiveSupport::Concern

  included do
    include HasAllAssets, Searchable, AddPath

    class_attribute :search_categories

    self.search_categories = true

    private

    def self.category
      titleized.pluralize
    end

    def self.controller
      "#{pluralized}Controller".to_sym
    end

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

    def self.search_cats(output, input, exclude_text)
      descendants.each do |desc|
        next unless desc.category =~ Regexp.new(input, "i")
        desc.class_exec { output.append_result(input, path_index, category) } 
      end
    end

    def self.search(*args)
      search_cats(*args) if search_categories
      search_default(*args)
    end
  end
end




