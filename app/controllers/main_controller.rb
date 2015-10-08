class MainController < ApplicationController
	def index
		@products = Product.all.as_json
		@perks = Perk.all.as_json
		@members = Member.all.as_json
	end
end
