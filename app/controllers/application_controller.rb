class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  
  ALL = {
    products: {
      name: {
        results: ->(input) { Product.fuzzy(:name, input).pluck(:category, :id, :name) },
        path: ->(result) { eval("#{result[0].singularize}_path(#{result[1]})") },
        display: ->(result) { result[2] }
      },
      category: {
        results: ->(input) { %w(products modifications).grep(Regexp.new(input, "i")) },
        path: ->(result) { eval("#{result}_path") },
        display: ->(result) { result }
      },
      info: {
        results: ->(input) { Product.fuzzy(:info, input).pluck(:category, :id, :info, :name).map { |res| res << input } },
        path: ->(result) { eval("#{result[0].singularize}_path(#{result[1]})") },
        display: ->(result) { "...#{result[2][Regexp.new("\\w*\\s*\\w*#{result[4]}\\w*\\s*\\w*", "i")]}... (#{result[3]})" }
      }
    },
    members: {
      name: {
        results: ->(input) { Member.fuzzy(:name, input).pluck(:id, :name, :title) },
        path: ->(result) { member_path(result[0]) },
        display: ->(result) { "#{result[1]} (#{result[2]})" }
      },
      title: {
        results: ->(input) { Member.fuzzy(:title, input).pluck(:id, :title, :name) },
        path: ->(result) { member_path(result[0]) },
        display: ->(result) { "#{result[1]} (#{result[2]})" }
      }
    },
    pdfs: {
      filename: {
        results: ->(input) { Pdf.fuzzy(:filename, input).pluck(:id, :filename) },
        path: ->(result) { download_pdf_path(result[0]) },
        display: ->(result) { result[1] }
      }
    }
  }

  def self.query(pool = ALL, input)
    output = {}
    pool.each do |search_for, fields|
      output[search_for] = {}
      fields.each do |field, lambdas|
        results = lambdas[:results].call(input)
        output[search_for][field] = results.map do |result|
          {
            path: lambdas[:path].call(result),
            display: lambdas[:display].call(result)
          }
        end
      end
    end
    output
  end
end
