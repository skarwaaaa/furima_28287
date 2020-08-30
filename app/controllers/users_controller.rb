class UsersController < ApplicationController
  # before_action :move_to_index,expect:[:index :show]
  def edit
    @nickname = nickname.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to root_path
    else
      render.new
    end
  end

  private

  def user_params
    params.require(:user).permit(:new, :create)
  end
end
