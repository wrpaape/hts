class SearchController < ApplicationController
  class_attribute :searchable, :search_all_pool
  
  def self.set_attributes(searchable)
    self.searchable = searchable
    self.search_all_pool = (searchable - searchable.flat_map(&:descendants)).map(&:search_pool).reduce({}, :merge)
  end

  def search
    search_pool = searchable_type.try(:search_pool) || search_all_pool
    render json: query(search_pool, params[:input])
  end

  private

  def searchable_type
    searchable && params[:type].try(:constantize)
  end

  def query(search_pool, input)
    output = []
    search_pool.each do |search_for, fields|
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
