class MainController < ApplicationController
  def index
    @header = header
    @home_page_images = HomePageImage.all
	end
end
