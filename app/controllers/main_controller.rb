class MainController < ApplicationController
  def index
    @nav_bar_props = {
      navBtnsAll: [
        {
          key: "goods",
          keyHead: "goods-index",
          path: products_path,
          display: "Products",
          navBtns: Good.all_nav_props
        },
        {
          key: "mods",
          keyHead: "mods-index",
          path: modifications_path,
          display: "Modifications",
          navBtns: Mod.all_nav_props
        }
      ],
      searchBar: {
        key: "search-bar",
        url: search_path,
        placeholder: "search everything"
      }
    }
	end

  def download_file
    pdf = Pdf.find(params[:id])
    send_file(path: pdf.path, filename: pdf.filename, type: "application/pdf")
  end
end
