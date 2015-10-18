class MainController < ApplicationController
  def index
    @header_locals = get_header_locals
	end
end
