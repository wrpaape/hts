module Searchable
  extend ActiveSupport::Concern
  include BuildPool

  included do
    class_attribute :top_level, :search_db

    self.top_level = true

    # def self.get_pool(exclude_text)
    #   exclude_text ? build_pool.tap { |pool| pool[tableized].delete(:info) } : build_pool
    # end

    def self.search(input, exclude_text)
      # results = opts[:attrs] ? search_database(input, field, opts[:attrs]) : search_categories(input)
      # output.push(send(opts[:display], results, input)) if results
    end

    def self.display_related(result, related)
      "#{result} (#{related})"
    end

    def self.display_text(input, result, related)
      match_neighbors = Regexp.new("\\w*\\.*\\s*\\w*#{input}\\w*\\.*\\s*\\w*", "i")
      "#{result[match_neighbors]}▓\u200B(#{related})"
    end

    def self.display_general(result)
      result
    end

    def self.search_by_db(input, field, attrs)
      where("#{field} ~* ?", input).pluck(*attrs)
    end

    def self.search_by_category(input)
      descendants.flat_map do |desc|
        desc.class_exec { [path_index, category] } if desc.category =~ Regexp.new(input, "i")
      end
    end

    def self.build_output(input, path, display)
      {
        key: path
        input: input,
        path: path,
        display: display
      }
    end

    def self.search(input, output)
      search_db.each do |display_method, pool|

      end
    end
  end
end




