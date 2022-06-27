class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(params.require(:item).permit(:name, :price))

    redirect_to items_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.name = params.require(:item).permit(:name)[:name]
    @item.price = params.require(:item).permit(:price)[:price]
    @item.save

    redirect_to items_path, :notice => "Your item has been updated"
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to items_path, :notice => "Your item has been deleted"
  end
end
