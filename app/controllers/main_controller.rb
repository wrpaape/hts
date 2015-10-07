class MainController < ApplicationController
	def index
		@units = Unit.all_as_json
		@perks = Perk.all_as_json
		@members = Member.all_as_json
	end
end
