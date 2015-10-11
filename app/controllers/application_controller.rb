class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  ALL = {
    products: {
      name: {
        results: Proc.new { |input| Product.fuzzy(:name, input).pluck(:path, :name) },
        path: Proc.new { |result| result[0] },
        display: Proc.new { |result| result[1] }
      },
      category: {
        results: Proc.new { |input| %w(products modifications).grep(Regexp.new(input, "i")) },
        path: Proc.new { |result| eval("#{result}_path") },
        display: Proc.new { |result| result }
      },
      info: {
        results: Proc.new { |input| Product.fuzzy(:info, input).pluck(:link, :info, :name) },
        path: Proc.new { |result| result[0] },
        display: Proc.new { |result, input| "...#{result[1][Regexp.new("\\w*\\s*\\w*#{input}\\w*\\s*\\w*", "i")]}... (#{result[2]})" }
      }
    },
    members: {
      name: {
        results: Proc.new { |input| Member.fuzzy(:name, input).pluck(:path, :name, :title) },
        path: Proc.new { |result| result[0] },
        display: Proc.new { |result| "#{result[1]} (#{result[2]})" }
      },
      title: {
        results: Proc.new { |input| Member.fuzzy(:title, input).pluck(:path, :title, :name) },
        path: Proc.new { |result| result[0] },
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

  # def query(pool = ALL, input)
  #   output = {}
  #   pool.each do |search_for, fields|
  #     fields.each do |field, procs|
  #       results = procs[:results].call(input)
  #       next if results.empty?
  #       output[search_for] ||= {}
  #       output[search_for][field] = results.map do |result|
  #         {
  #           path: instance_exec(result, &procs[:path]),
  #           display: procs[:display].call(result, input)
  #         }
  #       end
  #     end
  #   end
  #   output
  # end
  def query(pool = ALL, input)
    output = []
    pool.each do |search_for, fields|
      fields.each do |field, procs|
        procs[:results].call(input).each_with_index do |result, i|
          output.push({
            key: "#{input}-#{search_for}-#{field}-result-#{i}",
            input: input,
            path: instance_exec(result, &procs[:path]),
            display: procs[:display].call(result, input)
          })
        end
      end
    end
    output.first(10)
  end
end
