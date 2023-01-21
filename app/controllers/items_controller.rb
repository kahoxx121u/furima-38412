class ItemsController < ApplicationController

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
  end 

  private 

  def item_params
    params.require(:item).permit(:item_name, :image, :price, :text, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :delivery_day_id
    ).merge(user_id: current_user.id)
  end

end

