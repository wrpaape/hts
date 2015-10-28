class DocumentsController < ApplicationController
  def index
    @nav_bar_props = {
      navBtnsAll: [],
      searchBar: {
        key: "search-bar",
        url: document_search_path,
        placeholder: document_placeholder
      }
    }
  end
  
  private

  def document_type
    Product.descendants && params[:type].constantize 
  end

  def document_placeholder
     "search #{document_type.category.to_s.tr("/_/", " ")}"
  end

  def document_search_path
    eval("#{document_type.category}_search_path")
  end
end
