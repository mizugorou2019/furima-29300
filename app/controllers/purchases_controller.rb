class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase = PurchaseDelivery.new
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.purchase
      redirect_to root_path
    end
  end

  def create
    @purchase = PurchaseDelivery.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token, :user_id, :item_id, :purchase_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] 
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
