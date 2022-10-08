class ProductsController < ApplicationController
  before_action :set_supplier, only: %i[index edit new create show update destroy]

  def index
    @q = @supplier.products.ransack(params[:q])
    @pagy, @products = pagy(@q.result)
  end

  def show
    @product = @supplier.products.find(params[:id])
  end

  def edit
    @product = @supplier.products.find(params[:id])
  end

  def update
    respond_to do |format|
      @product = @supplier.products.find(params[:id])
      if @product.update(product_params)
        format.html { redirect_to supplier_products_url, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @product = Product.new
  end

  def create
    respond_to do |format|
      @product = @supplier.products.new(product_params)
      if @product.save
        format.html { redirect_to supplier_products_path(@supplier, @product), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :product_type, :plate_number, :capacity, :registration_date, :image )
  end

  def set_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end
end
