class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :move_to_index, except: [:index, :show]

  def index
    end

  def new
    # if current_user == null
    #   redirect_to ("/new/item")
    # end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :new
    end
  end

end
