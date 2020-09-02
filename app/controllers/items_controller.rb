class ItemsController < ApplicationController

  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category, :condition, :postage_payer, :shipping_origin, :preparation_day).merge(user_id: current_user.id)
  end

end
