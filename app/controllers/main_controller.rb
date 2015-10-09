class MainController < ApplicationController
	def index
		@goods = Good.all_main_index
		@mods = Mod.all_main_index
		@members = Member.all.as_json
	end

  def search
    
  end
end
