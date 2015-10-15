class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def self.results_proc(model, search_for)
    pluck_results =
      case search_for
        when :name
          model == Member ? [:path_show, :name, :title] : [:path_show, :name] 
        when :category
          return Proc.new { |input| %w(products modifications).grep(Regexp.new(input, "i")).map { |cat| [eval("#{cat}_path"), cat] } }
        when :info
          [:path_show, :info, :name]
        when :title
          [:path_show, :title, :name]
        when :filename
          [:path_alt, :filename]
      end
    Proc.new { |input| model.where("#{search_for} ~* ?", input).pluck(*pluck_results) }
  end

  def self.display_proc(model, search_for)
    return Proc.new { |result| "#{result[1]} (#{result[2]})" } if model == Member
    case search_for
      when :info
        Proc.new { |result, input| "#{result[1][Regexp.new("\\w*\\.*\\s*\\w*#{input}\\w*\\.*\\s*\\w*", "i")]}▓(#{result[2]})" }
      else
        Proc.new { |result| result[1] }
    end
  end

  def self.build_procs(model, search_for)
    Hash[[:results, :display].map { |proc_type| [proc_type, eval("#{proc_type}_proc(model, search_for)")] }]
  end

  def self.build_categories(model, search_fors)
    Hash[search_fors.map { |search_for| [search_for, build_procs(model, search_for)] }]
  end

  def self.build_constant(model, search_fors)
    Hash[model.to_s.underscore.pluralize.to_sym, build_categories(model, search_fors)]
  end

  PRODUCTS = build_constant(Product, [:name, :category, :info])
  GOODS = build_constant(Good, [:name, :info])
  MODS = build_constant(Mod, [:name, :info])
  MEMBERS = build_constant(Member, [:name, :title])
  PDFS = build_constant(Pdf, [:filename])
  
  ALL = [PRODUCTS, MEMBERS, PDFS].reduce({}, :merge)

  def query(pool = ALL, input)
    output = []
    pool.each do |search_for, fields|
      fields.each do |field, procs|
        instance_exec(input, &procs[:results]).each_with_index do |result, i|
          output.push({
            key: "#{input}-#{search_for}-#{field}-result-#{i}",
            input: input,
            path: result[0],
            display: procs[:display].call(result, input)
          })
        end
      end
    end
    output.first(10)
  end
end
