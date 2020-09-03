class ItemsController < ApplicationController
  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to action: :index
    end
  end

  def create
    @item = Item.new(item_params)

    if @item.valid?
      @item.save
      redirect_to action: :index
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category, :condition, :postage_payer, :shipping_origin, :preparation_day).merge(user_id: current_user.id)
  end
end
