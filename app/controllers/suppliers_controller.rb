class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[show edit update destroy]


  def index
    @q = Supplier.ransack(params[:q])
    @pagy, @suppliers = pagy(@q.result)
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to supplier_url(@supplier), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    respond_to do |format|
      if @supplier.save
        format.html { redirect_to supplier_path(@supplier), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :address, :phone_number, :email, :telephone, :image)
  end

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end
end
