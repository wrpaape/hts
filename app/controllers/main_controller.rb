class MainController < ApplicationController
	def index
		@units = Unit.all
		@perks = Perk.all
		@members = Member.all
	end
end
