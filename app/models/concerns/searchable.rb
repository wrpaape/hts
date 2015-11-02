module Searchable
  extend ActiveSupport::Concern
  # include BuildPool

  included do
    class_attribute :top_level?, :search_opts

    self.top_level? = true

    # def self.get_pool(exclude_text)
    #   exclude_text ? build_pool.tap { |pool| pool[tableized].delete(:info) } : build_pool
    # end

    # def self.search(input, exclude_text)
      # results = opts[:attrs] ? search_database(input, field, opts[:attrs]) : search_categories(input)
      # output.push(send(opts[:display], results, input)) if results
    # end

    private

    def self.search_db(input, attrs)
      where("#{attrs.first} ~* ?", input).pluck(*attrs)
    end

    def self.display_general(input, result)
      result
    end

    def self.display_labeled(result, label)
      "#{result} (#{label})"
    end

    def self.display_text(input, result, label)
      match_neighbors = Regexp.new("\\w*\\.*\\s*\\w*#{input}\\w*\\.*\\s*\\w*", "i")
      "#{result[match_neighbors]}▓\u200B(#{label})"
    end

    def self.search_default(exclude_text, input, output)
      db_opts.tap { |opts|  opts.delete(:display_text) if exclude_text }.each do |display, attrs|
        search_db(input, attrs).each do |result|
          output.push({
            key: "result-#{output.length}",
            input: input,
            path: result.pop,
            display: send(display, input, *result)
          })
        end
      end
    end

    def self.search(*args)
      search_default(*args)
    end

    def self.search_cats(input)
      descendants.flat_map do |desc|
        desc.class_exec { [path_index, category] } if desc.category =~ Regexp.new(input, "i")
      end
    end
  end
end




