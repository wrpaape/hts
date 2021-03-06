module Searchable
  extend ActiveSupport::Concern

  included do
    class_attribute :top_level, :db_opts

    self.top_level = true

    private

    def self.search_db(input, attrs)
      where("#{attrs.first} ~* ?", input).limit(5).pluck(*attrs)
    end

    def self.display_general(input, result)
      result
    end

    def self.display_labeled(input, result, label)
      "#{result} (#{label})"
    end

    def self.display_text(input, result, label)
      match_neighbors = Regexp.new("\\w*\\.*\\s*\\w*#{input}\\w*\\.*\\s*\\w*", "i")
      "#{result[match_neighbors]}▓\u200B(#{label})"
    end

    def self.search_default(output, input, exclude_text)
      db_opts.each do |display, attr_sets|
        next if exclude_text && display == :display_text
        attr_sets.each do |attrs|
          search_db(input, attrs).each do |result|
            output.append_result(input, result.pop, send(display, input, *result))
          end
        end
      end
    end

    singleton_class.send(:alias_method, :search, :search_default)
  end
end




