class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    redirect_to root_path
  end

end
