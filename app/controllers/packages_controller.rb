class PackagesController < ApplicationController
  before_action :set_supplier,
                only: %i[index show edit new create update destroy]

  def index
    @packages = @supplier.packages
  end

  def show
    @package = @supplier.packages.find(params[:id])
  end

  def edit
    @package = @supplier.packages.find(params[:id])
  end

  def update
    respond_to do |format|
      @package = @supplier.packages.find(params[:id])
      if @package.update(package_params)
        format.html do
          redirect_to supplier_packages_url,
                      notice: "Product was successfully updated."
        end
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @package.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def new
    @package = @supplier.packages.new
  end

  def create
    respond_to do |format|
      @package = @supplier.packages.new(package_params)
      if @package.save
        format.html do
          redirect_to supplier_packages_path(@supplier, @package),
                      notice: "Student was successfully updated."
        end
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @package.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    package = Package.find(params[:id])
    package.destroy
  end

  private

  def package_params
    params.require(:package).permit(
      :name,
      :supplier_id,
      :image,
      :package_type,
      :description,
      :min_quantity,
      :max_quantity,
      :price_per_head,
      :status,
      amenity_ids: [],
      product_ids: []
    )
  end

  def set_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end
end
