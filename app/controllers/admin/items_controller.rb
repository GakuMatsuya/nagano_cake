class Admin::ItemsController < ApplicationController
  
  before_action :authenticate_admin!


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(admin_item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def index
   #@items = Item.all
   @search = Item.ransack(params[:q])
   @items = @search.result
  end
  
  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(admin_item_params)
    redirect_to admin_item_path(@item)
  end

  private

  def admin_item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end
end
