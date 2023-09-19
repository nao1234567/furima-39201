class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :status_id, :cost_id, :prefecture_id, :shipping_date_id, :price,
                                    :image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    return if current_user.id == @product.user.id

    redirect_to root_path
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
