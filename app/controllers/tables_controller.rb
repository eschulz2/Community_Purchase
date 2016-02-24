class TablesController < ApplicationController

	def index
	end

	def new
		@table = Table.new
	end

	def create 
		@table = Table.create(table_params)
		 
	  if @table.save
		  redirect_to @table
		else
			flash[:alert] = "Failed to Create"
			redirect_to :back
		end
	end

	def show
		@table = Table.find(params[:id])
	end

	def edit
		@table = Table.find(params[:id])
	end

	def update
		@table = Table.find(params[:id])
		 
	  if @table.update(table_params)
		  redirect_to @table
		else
			flash[:alert] = "Failed to Update"
			redirect_to @table
		end
	end

	private

	def table_params
	  params.require(:table).permit(:datetime, :location, :address, :description, :price)
	end

end
