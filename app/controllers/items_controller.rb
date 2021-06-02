class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_item, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    return if user_signed_in? && current_user.id == @item.user_id

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :price, :category_id, :condition_id, :payment_id,
                                 :prefecture_id, :delivery_time_id).merge(user_id: current_user.id)
  end

def find_item
  @item = Item.find(params[:id])
end

end
