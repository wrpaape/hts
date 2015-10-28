module BuildPool
  extend ActiveSupport::Concern

  included do
    def self.results_proc(search_for)
      searchable_model = self
      attrs =
        case search_for
          when :type_display
            return Proc.new { |input| searchable_model.instance_exec { descendants.push(self) }.map(&:category).grep(Regexp.new(input.tr("/ /", "_"), "i")).map { |cat| [send("#{cat}_path"), cat] } }
          when :name
            [:path_show, :name] 
          when :full_name
            [:path_show, :name, :job_title] 
          when :job_title
            [:path_show, :job_title, :name]
          when :info
            [:path_show, :info, :name]
          when :body
            [:path_show, :body, :title]
          when :filename
            [:path_dl, :filename]
        end

      Proc.new { |input| searchable_model.where("#{search_for} ~* ?", input).pluck(*attrs) }
    end

    def self.display_proc(search_for)
        return Proc.new { |result| "#{result[1]} (#{result[2]})" } if self == Employee
      case search_for
        when :info, :body
          Proc.new { |result, input| "#{result[1][Regexp.new("\\w*\\.*\\s*\\w*#{input}\\w*\\.*\\s*\\w*", "i")]}▓\u200B(#{result[2]})" }
        when :type_display
          Proc.new { |result| result[1].tr("/_/", " ").titleize(exclude: %w(and)) }  
        else
          Proc.new { |result| result[1] }
      end
    end

    def self.build_procs(search_for)
      [:results, :display].hash_map { |proc_type| send("#{proc_type}_proc", search_for) }
    end

    def self.build_categories
      pool_fields.hash_map { |search_for| build_procs(search_for) }
    end

    def self.build_pool
      Hash[to_s.fileize.pluralize.to_sym, build_categories]
    end
  end
end