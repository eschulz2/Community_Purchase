class TablesController < ApplicationController

	def index
	end

	def new
		if user_signed_in? && current_user.email == "eschulz2@gmail.com"
		  @table = Table.new
		else
			redirect_to :root
		end
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
		if user_signed_in? && current_user.email == "eschulz2@gmail.com"
		  @table = Table.new
		else
			redirect_to :root
		end
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
