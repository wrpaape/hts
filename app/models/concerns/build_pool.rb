module BuildPool
  extend ActiveSupport::Concern

  included do
    def self.results_proc(search_for)
      searchable_model = self
      attrs =
        case search_for
          when :name, :full_name
            searchable_model == Employee ? [:path_show, :name, :title] : [:path_show, :name] 
          when :type_display
            return Proc.new { |input| Product.subclasses.map(&:category).grep(Regexp.new(input, "i")).map { |cat| [eval("#{cat}_path"), cat] } }
          when :info
            [:path_show, :info, :name]
          when :title
            [:path_show, :title, :name]
          when :filename
            [:path_dl, :filename]
        end
      Proc.new { |input| searchable_model.where("#{search_for} ~* ?", input).pluck(*attrs) }
    end

    def self.display_proc(search_for)
      searchable_model = self
      10.times {pp searchable_model}
      return Proc.new { |result| "#{result[1]} (#{result[2]})" } if searchable_model == Employee
      case search_for
        when :info
          Proc.new { |result, input| "#{result[1][Regexp.new("\\w*\\.*\\s*\\w*#{input}\\w*\\.*\\s*\\w*", "i")]}▓\u200B(#{result[2]})" }
        else
          Proc.new { |result| result[1] }
      end
    end

    def self.build_procs(search_for)
      Hash[[:results, :display].map { |proc_type| [proc_type, eval("#{proc_type}_proc(search_for)")] }]
    end

    def self.build_categories
      Hash[pool_fields.map { |search_for| [search_for, build_procs(search_for)] }]
    end

    def self.build_pool
      Hash[to_s.underscore.pluralize.to_sym, build_categories]
    end
  end
end