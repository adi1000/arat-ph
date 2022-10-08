class AmenitiesController < ApplicationController
  before_action :set_supplier, only: %i[index show edit update new create destroy]

  def index
    @amenities = @supplier.amenities
  end

  def show
    @amenity = Amenity.find(params[:id])
  end

  def edit
    @amenity = Amenity.find(params[:id])
  end

  def update
    respond_to do |format|
      @amenity = @supplier.amenities.find(params[:id])
      if @amenity.update(amenity_params)
        format.html { redirect_to @amenity, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @amenity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @amenity.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @amenity = Amenity.new
  end

  def create
    respond_to do |format|
      @amenity = @supplier.amenities.new(amenity_params)
      if @amenity.save
        format.html { redirect_to supplier_amenities_path, notice: "Subject was successfully created." }
        format.json { render :show, status: :ok, location: amenity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: amenity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    amenity = Amenity.find(params[:id])
    amenity.destroy
  end

  private

  def amenity_params
    params.require(:amenity).permit(:name)
  end

  def set_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end
end
