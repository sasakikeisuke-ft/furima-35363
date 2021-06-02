class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

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
    @item = Item.find(params[:id])
      unless user_signed_in? && current_user.id == @item.user_id
      # 売却済みだと、ログインしている出品者でもトップページへ遷移する。
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
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
end
