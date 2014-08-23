class LightsabersController < ApplicationController
  before_action :set_lightsaber, only: [:show, :edit, :update, :destroy]

  # GET /lightsabers
  # GET /lightsabers.json
  def index
    @lightsabers = Lightsaber.where("color like ?", "%#{params[:q]}%")
  end

  # GET /lightsabers/1
  # GET /lightsabers/1.json
  def show
  end

  # GET /lightsabers/new
  def new
    @lightsaber = Lightsaber.new
  end

  # GET /lightsabers/1/edit
  def edit
  end

  # POST /lightsabers
  # POST /lightsabers.json
  def create
    @lightsaber = Lightsaber.new(lightsaber_params)

    respond_to do |format|
      if @lightsaber.save
        format.html { redirect_to @lightsaber, notice: 'Lightsaber was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lightsaber }
      else
        format.html { render action: 'new' }
        format.json { render json: @lightsaber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lightsabers/1
  # PATCH/PUT /lightsabers/1.json
  def update
    respond_to do |format|
      if @lightsaber.update(lightsaber_params)
        format.html { redirect_to @lightsaber, notice: 'Lightsaber was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lightsaber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lightsabers/1
  # DELETE /lightsabers/1.json
  def destroy
    @lightsaber.destroy
    respond_to do |format|
      format.html { redirect_to lightsabers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lightsaber
      @lightsaber = Lightsaber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lightsaber_params
      params.require(:lightsaber).permit(:name, :description, :color, :darkside, :image)
    end
end
