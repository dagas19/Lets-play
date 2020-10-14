class UsersController < ApplicationController
  before_action :authenticate_user!
  def me
    @user = current_user
    authorize @user
  end

  # def show; end

  def show
    @user = User.find(params[:id])
    if user_signed_in?
      authorize @user
    end
  end


  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to(me_path, notice: 'Your user profile was updated')
    else
      redirect_to(me_path, alert: 'Something went wrong, user profile not updated')
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :photo, :password, :gender_id, :nickname, :preferred_games, :address, :age)
  end
end
