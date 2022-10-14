class PackageOrdersController < ApplicationController
  before_action :set_package_order, only: %i[show edit update destroy]

  def index
    @package_orders = PackageOrder.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      @package_order = PackageOrder.find(params[:id])
      if @package_order.update(package_order_params)
        format.html do
          redirect_to package_orders_url,
                      notice: "Product was successfully updated."
        end
        format.json { render :show, status: :ok, location: @package_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @package_order.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def new
    @package_order = PackageOrder.new
  end

  def create
    respond_to do |format|
      package_order = PackageOrder.new(package_order_params)
      if package_order.save
        format.html do
          redirect_to package_orders_url,
                      notice: "Subject was successfully created."
        end
        format.json { render :show, status: :ok, location: package_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: package_order.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @package_order.destroy
    redirect_to package_orders_url
  end

  private

  def package_order_params
    params.require(:package_order).permit(:purchase_quantity, :package_id)
  end

  def set_package_order
    @package_order = PackageOrder.find(params[:id])
  end
end
