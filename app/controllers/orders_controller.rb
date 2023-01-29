class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

def index
  @item = Item.find(params[:item_id])
  @order_payment = OrderPayment.new
end

def create
  @item = Item.find(params[:item_id])
  @order_payment = OrderPayment.new(order_params)
    if @order_payment.valid?
     pay_item
     @order_payment.save
       return redirect_to root_path
    else
      render :index
    end
end

private

  def order_params
    params.require(:order_payment).permit(:postal_number, :prefecture_id, :city, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def non_purchased_item
    # itemがあっての、order_form（入れ子構造）。他のコントローラーで生成されたitemを使うにはcreateアクションに定義する。
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

end
