class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    @item = Item.find(params[:id])
    render json: @item
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item, status: 201
    else
      "please make sure you have all the info, item was not created"
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end

end
