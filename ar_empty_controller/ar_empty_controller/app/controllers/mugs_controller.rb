class MugsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def mug_params
      params.require(:mug).permit(:capacity, :material, :decoration)
    end
end
