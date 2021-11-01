class ItemsController < ApplicationController
  before_action :authenticate_user!,only:[:new, :create, :edit]
  before_action :move_to_index,only: [:edit]
  before_action :summarize,only: [:show, :edit, :update]

  def index
    @items = Item.all.order(id: "DESC")
  end 

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      render root_path
    else
      render :new
    end
  end

  def show
    summarize
  end    

  def edit
    summarize
  end  

  def update
    summarize
    if @item.update(item_params)
      
      render item_path
    else
      render :edit
    end
  end

    private
    def item_params
      params.require(:item).permit(:product_name, :explanation, :category_id, :condition_id, :shipping_cost_id, :shipping_agent_id, :shopping_day_id, :price, :image).merge(user_id: current_user.id)
    end

    def move_to_index
      unless current_user.id == Item.find(params[:id]).user.id
        redirect_to root_path
      end

      def summarize
        @item = Item.find(params[:id])
      end  
    end

   
end