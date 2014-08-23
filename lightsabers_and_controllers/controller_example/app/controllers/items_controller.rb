class ItemsController < ApplicationController
  def index
		@items = Item.all
  end

  def show
		# render text: params.inspect
		# render text: params[:id]
		@item = Item.find( params[:id] )
  end

  def new
  end

  def edit
  end
end
