class PurchasesController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @product = Product.find(params[:product_id])
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      pay_product
      @purchase_delivery.save
      return redirect_to root_path 
    else
      @product = Product.find(params[:product_id])
      render :index
    end
  end
    
  private
  
  def purchase_params
    params.require(:purchase_delivery).permit(:post_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id],token: params[:token])

  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end



end
