class TouristSpotsController < ApplicationController
  before_action:set_tourist_spot, only: %i[show edit update destroy]


  def index
    @tourist_spots = TouristSpot.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      @tourist_spot = TouristSpot.find(params[:id])
        if @tourist_spot.update(tourist_spot_params)
          format.html do
            redirect_to tourist_spots_url,
                        notice: "Product was successfully updated."
          end
          format.json { render :show, status: :ok, location: @tourist_spot }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json do
            render json: @tourist_spot.errors, status: :unprocessable_entity
          end
        end
      end
    end

  def new
    @tourist_spot = TouristSpot.new
  end

  def create
    respond_to do |format|
      tourist_spot = TouristSpot.new(tourist_spot_params)
        if tourist_spot.save
          format.html do
            redirect_to tourist_spots_url,
                        notice: "Product was successfully updated."
          end
          format.json { render :show, status: :ok, location: tourist_spot }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json do
            render json: tourist_spot.errors, status: :unprocessable_entity
          end
        end
      end
  end

  def destroy
    @tourist_spot.destroy

    redirect_to tourist_spots_url
  end

  private

  def tourist_spot_params
    params.require(:tourist_spot).permit(:name, :description, package_ids: [], images: [])
  end

  def set_tourist_spot
    @tourist_spot = TouristSpot.find(params[:id])
  end

end
