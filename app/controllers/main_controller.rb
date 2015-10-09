class MainController < ApplicationController
  def index
		@goods = Good.all_main_index
		@mods = Mod.all_main_index
		@members = Member.all.as_json
    @url = search_path
    @placeholder = "search everything"
	end

  def search
    render json: self.query(params[:input])
  end

  def download_file
    pdf = Pdf.find(params[:id])
    send_file(path: pdf.path, filename: pdf.filename, type: "application/pdf")
  end
end
