class EpisodesController < ApplicationController
before_action :set_episode, only: [:edit, :show, :destroy, :update]


  def index
    @episodes = Episode.order(:episode_number)
  end

  def show
  end

  def new
    @episode = Episode.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @episode = Episode.new(episode_params)
    respond_to do |format|
      if @episode.save
        format.html { redirect_to episodes_path, notice: 'Episode was successfully created.' }
        format.json { render action: 'show', status: :created, location: @episode }
      else
        format.html { render action: 'new' }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @episode.update(episode_params)
        format.html { redirect_to @episode, notice: 'Episode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @episode.destroy
    respond_to do |format|
      format.html { redirect_to episodes_index_path, notice: "Episode #{@episode.episode_number} was deleted" }
    end
  end

  private

    def set_episode
        @episode = Episode.find(params[:id])
    end
    def episode_params
        params.require(:episode).permit(:title, :description, :episode_number)
    end
end
