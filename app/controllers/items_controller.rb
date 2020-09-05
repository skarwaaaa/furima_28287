class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :move_to_index, except: [:index, :show]

  def index
    end

  def new
    @item = Item.new
    # if current_user == null
    #   redirect_to ("/new/item")
    # end
  end
  
  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

    def move_to_index
    unless user_signed_in?
      redirect_to action: :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :price, :category_id, 
    :status_id, :delivery_fee_id, :prefecture_id, :shipping_date_id,).merge(user_id: current_user.id)
    
  end
end
