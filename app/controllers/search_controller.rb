class SearchController < ApplicationController
  skip_before_action :set_header

  cattr_reader :searchables do
    ActiveRecord::Base.descendants.select { |model| model.include?(Searchable) }
  end
  
  def search
    output = []
    catch :max_results do
      (searchable_type || self.class).search(output, escaped_input, exclude_text?)
    end
    
    render json: output
  end

  private

  def type_match
    resource = request.path.scan(/[^\/]+(?=\/search)/).first
    resource && Regexp.new(resource)
  end

  def searchable_type
    searchables.find { |model| type_match === model.tableized } if type_match
  end

  def escaped_input
    Regexp.escape(params[:input])
  end

  def exclude_text?
    params[:input].length < 3
  end

  def self.search(*args)
    searchables.select(&:top_level).each { |model| model.search(*args) }
  end


  # def get_pool(exclude_text)
  #   searchables.select(&:top_level).map { |model| model.get_pool(exclude_text) }.reduce({}, :merge)
  # end

  # def query(search_pool, input)
  #   output = []
  #   search_pool.each do |search_for, fields|
  #     fields.each do |field, procs|
  #       procs[:results].call(input).each_with_index do |result, i|
  #         output.push({
  #           key: "#{input}-#{search_for}-#{field}-result-#{i}",
  #           input: input,
  #           path: result[0],
  #           display: procs[:display].call(result, input)
  #         })
  #         return output if output.length > 4
  #       end
  #     end
  #   end
  #   output
  # end
end
