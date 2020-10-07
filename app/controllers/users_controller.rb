class UsersController < ApplicationController

  def me
    @user = current_user
    authorize @user
  end

  def show

  end


end
