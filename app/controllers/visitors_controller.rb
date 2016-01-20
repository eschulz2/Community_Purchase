class VisitorsController < ApplicationController

	def index
		@tables = Table.all
	end
end
