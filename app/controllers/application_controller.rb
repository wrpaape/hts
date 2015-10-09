class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  
  ALL = {
    products: {
      name: {
        results: Proc.new { |input| Product.fuzzy(:name, input).pluck(:category, :id, :name) },
        path: Proc.new { |result| eval("#{result[0].singularize}_path(#{result[1]})") },
        display: Proc.new { |result| result[2] }
      },
      category: {
        results: Proc.new { |input| %w(products modifications).grep(Regexp.new(input, "i")) },
        path: Proc.new { |result| eval("#{result}_path") },
        display: Proc.new { |result| result }
      },
      info: {
        results: Proc.new { |input| Product.fuzzy(:info, input).pluck(:category, :id, :info, :name) },
        path: Proc.new { |result| eval("#{result[0].singularize}_path(#{result[1]})") },
        display: Proc.new { |result, input| "...#{result[2][Regexp.new("\\w*\\s*\\w*#{input}\\w*\\s*\\w*", "i")]}... (#{result[3]})" }
      }
    },
    members: {
      name: {
        results: Proc.new { |input| Member.fuzzy(:name, input).pluck(:id, :name, :title) },
        path: Proc.new { |result| member_path(result[0]) },
        display: Proc.new { |result| "#{result[1]} (#{result[2]})" }
      },
      title: {
        results: Proc.new { |input| Member.fuzzy(:title, input).pluck(:id, :title, :name) },
        path: Proc.new { |result| member_path(result[0]) },
        display: Proc.new { |result| "#{result[1]} (#{result[2]})" }
      }
    },
    pdfs: {
      filename: {
        results: Proc.new { |input| Pdf.fuzzy(:filename, input).pluck(:id, :filename) },
        path: Proc.new { |result| download_pdf_path(result[0]) },
        display: Proc.new { |result| result[1] }
      }
    }
  }

  def self.query(pool = ALL, input)
    output = {}
    pool.each do |search_for, fields|
      fields.each do |field, procs|
        results = procs[:results].call(input)
        next if results.empty?
        output[search_for] ||= {}
        output[search_for][field] = results.map do |result|
          {
            path: procs[:path].call(result),
            display: procs[:display].call(result, input)
          }
        end
      end
    end
    output
  end
end
