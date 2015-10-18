class SearchController < ApplicationController
  class_attribute :searchable, :search_pool, :search_pool_no_text
  
  def self.set_attributes(searchable)
    self.searchable = searchable
    combine_pools = ->(search_pool) { (searchable - searchable.flat_map(&:descendants)).map(&search_pool).reduce({}, :merge) }
    self.search_pool = combine_pools.call(:search_pool)
    self.search_pool_no_text = combine_pools.call(:search_pool_no_text)
  end

  def search
    render json: query(get_search_pool, params[:input])
  end

    # searchable = ActiveRecord::Base.descendants.select{ |model| model.include?(Searchable) }
    searchable = [Employee, Pdf, Product, Good, Mod]
    searchable.each(&:set_pools)
    set_attributes(searchable)

  private

  def get_search_pool
    searchable_type.send(search_text? ? :search_pool : :search_pool_no_text)
  end

  def search_text?
    params[:input].length > 2
  end

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
          return output if output.length > 9
        end
      end
    end
    output
  end
end
