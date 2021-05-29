class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def item_params
    params.require(:user).permit(:item_name, :item_description, :price, :category_id, :condition_id, :payment_id, :prefecture_id, :delivery_time_id).merge(user_id: current_user.id)
  end

end
