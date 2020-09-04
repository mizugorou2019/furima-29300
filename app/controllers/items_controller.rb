class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]

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

  def show
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    Item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category_id, :condition_id, :postage_payer_id, :shipping_origin_id, :preparation_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
