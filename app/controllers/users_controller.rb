class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params_update)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:city,:email,:photo, :password)
  end

  def user_params_update
    params.require(:user).permit(:nickname,:city,:email,:photo, :password)

    # this is a test
  end
end
