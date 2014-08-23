class EpisodesController < ApplicationController
  before_action :set_episode, only: [:edit, :show, :delete, :update]


  def index
    @episodes = Episodes.all
  end

  def show
  end

  def new
    @episode = Episodes.new
  end

  def create
    # @episode = Episode.new(episode_params)
    # respond_to do |format|
    #   if @episode.save
    #     format.html { redirect_to @episode, notice: 'Episode was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @episode }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @episode.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

    def set_episode
        @episode = Episodes.find(params[:id])
    end
    def episode_params
        params.require(:episodes).permit(:title, :description, :episode_number)
    end
end
