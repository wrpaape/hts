class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def results_proc(model, search_for)
    pluck_results =
      case search_for
        when :name
          model == Member ? [:path_show, :name] : [:path_show, :name, :title] 
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

  def display_proc(model, search_for)
    return Proc.new { |result| "#{result[1]} (#{result[2]})" } if model == Member
    case search_for
      when :info
        Proc.new { |result, input| "#{result[1][Regexp.new("\\w*\\.*\\s*\\w*#{input}\\w*\\.*\\s*\\w*", "i")]}▓(#{result[2]})" }
      else
        Proc.new { |result| result[1] }
    end
  end

  PRODUCTS = {
    products: {
      name: {
        results: Proc.new { |input| Product.where("name ~* ?", input).pluck(:path_show, :name) },
        display: Proc.new { |result| result[1] }
      },
      category: {
        results: Proc.new { |input| %w(products modifications).grep(Regexp.new(input, "i")).map { |cat| [eval("#{cat}_path"), cat] } },
        display: Proc.new { |result| result[1] }
      },
      info: {
        results: Proc.new { |input| Product.where("info ~* ?", input).pluck(:path_show, :info, :name) },
        display: Proc.new { |result, input| "#{result[1][Regexp.new("\\w*\\.*\\s*\\w*#{input}\\w*\\.*\\s*\\w*", "i")]}▓(#{result[2]})" }
      }
    }
  }
  GOODS = {
    goods: {
      name: {
        results: Proc.new { |input| Good.where("name ~* ?", input).pluck(:path_show, :name) },
        display: Proc.new { |result| result[1] }
      },
      info: {
        results: Proc.new { |input| Good.where("info ~* ?", input).pluck(:path_show, :info, :name) },
        display: Proc.new { |result, input| "#{result[1][Regexp.new("\\w*\\.*\\s*\\w*#{input}\\w*\\.*\\s*\\w*", "i")]}▓(#{result[2]})" }
      }
    }
  }
  MODS = {
    goods: {
      name: {
        results: Proc.new { |input| Mod.where("name ~* ?", input).pluck(:path_show, :name) },
        display: Proc.new { |result| result[1] }
      },
      info: {
        results: Proc.new { |input| Mod.where("info ~* ?", input).pluck(:path_show, :info, :name) },
        display: Proc.new { |result, input| "#{result[1][Regexp.new("\\w*\\.*\\s*\\w*#{input}\\w*\\.*\\s*\\w*", "i")]}▓(#{result[2]})" }
      }
    }
  }
  MEMBERS = {
      members: {
      name: {
        results: Proc.new { |input| Member.where("name ~* ?", input).pluck(:path_show, :name, :title) },
        display: Proc.new { |result| "#{result[1]} (#{result[2]})" }
      },
      title: {
        results: Proc.new { |input| Member.where("title ~* ?", input).pluck(:path_show, :title, :name) },
        display: Proc.new { |result| "#{result[1]} (#{result[2]})" }
      }
    }
  }
  PDFS = {
    pdfs: {
      filename: {
        results: Proc.new { |input| Pdf.where("filename ~* ?", input).pluck(:path_alt, :filename) },
        display: Proc.new { |result| result[1] }
      }
    }
  }
  ALL = {
    products: PRODUCTS[:products],
    members: MEMBERS[:members],
    pdfs: PDFS[:pdfs]
  }

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
