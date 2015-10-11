class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  ALL = {
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
    },
    members: {
      name: {
        results: Proc.new { |input| Member.where("name ~* ?", input).pluck(:path_show, :name, :title) },
        display: Proc.new { |result| "#{result[1]} (#{result[2]})" }
      },
      title: {
        results: Proc.new { |input| Member.where("title ~* ?", input).pluck(:path_show, :title, :name) },
        display: Proc.new { |result| "#{result[1]} (#{result[2]})" }
      }
    },
    pdfs: {
      filename: {
        results: Proc.new { |input| Pdf.where("filename ~* ?", input).pluck(:path_alt, :filename) },
        display: Proc.new { |result| result[1] }
      }
    }
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
