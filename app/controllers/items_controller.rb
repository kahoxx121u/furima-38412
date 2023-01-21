class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private 

  def item_params
    params.require(:item).permit(:item_name, :image, :price, :text, :category_id, :condition_id, :deliveryCharge_id, :prefecture_id, :deliveryDay_id
    ).merge(user_id: current_user.id)
  end

end

