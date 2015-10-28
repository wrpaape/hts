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
     "search #{document_type.category.tr("/_/", " ")}"
  end

  def document_search_path
    send("search#{document_type.category}_path")
  end
end
