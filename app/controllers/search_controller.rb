class SearchController < ApplicationController
  skip_before_action :set_header
  class_attribute :searchable
  
  def self.get_pool(exclude_text)
    (searchable - searchable.flat_map(&:descendants)).map { |model| model.get_pool(exclude_text) }.reduce({}, :merge)
  end

  def search
    search_pool = searchable_type.get_pool(exclude_text?)
    render json: query(search_pool, escaped_input)
  end

  self.searchable = [
    Employee,
    Pdf,
    Product, Good, Mod, EquipScreen, ExtGasSec, VRVAcc,
    Document, Catalog, Drawing, InstallManual, PartsList
  ]
    
  private

  def escaped_input
    Regexp.escape(params[:input])
  end

  def exclude_text?
    params[:input].length < 3
  end

  def searchable_type
    searchable && params[:type].safe_constantize
  end

  def query(search_pool, input)
    output = []
    search_pool.each do |search_for, fields|
      fields.each do |field, procs|
        procs[:results].call(input).each_with_index do |result, i|
          output.push({
            key: "#{input}-#{search_for}-#{field}-result-#{i}",
            input: input,
            path: result[0],
            display: procs[:display].call(result, input)
          })
          return output if output.length > 4
        end
      end
    end
    output
  end
end
