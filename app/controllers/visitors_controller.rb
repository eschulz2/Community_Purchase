class VisitorsController < ApplicationController

	def index
		@tables = Table.all
	end

	def cuvee
		@tables = Table.where(location: 'Cuvee')
	end

	def shay
		@tables = Table.where(location: 'Shay')
	end
end
