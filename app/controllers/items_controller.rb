class ItemsController < ApplicationController
  before_action :authenticate_user!,only:[:new, :create]
  def index
    @items = Item.all
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
      params.require(:item).permit(:product_name, :explanation, :category_id, :condition_id, :shipping_cost_id, :shipping_agent_id, :shopping_day_id, :price, :image).merge(user_id: current_user.id)
    end
end