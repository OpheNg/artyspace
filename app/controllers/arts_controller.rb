class ArtsController < ApplicationController
  def index
    @user = current_user
    @arts = Art.where(user_id: current_user.id)
  end

  def show
    @art = Art.find(params[:id])
  end

  def new
    @user = current_user
    @art = Art.new
  end

  def create
    @user = current_user
    @art = Art.new(art_params)
    @art.user_id = current_user.id

    if @art.save
      flash[:notice] = "Post created"
      redirect_to arts_path
    else
      flash[:notice] = "Something went wrong, please check the form again"
    end
  end

  def edit
    @art = Art.find(params[:id])
    @user = current_user
  end

  def update
    @art = Art.find(params[:id])
    @user = current_user

    if @art.update(art_params_update)
      flash[:notice] = "post updated"
      redirect_to arts_path
    else
      render :edit
    end

  end

  def destroy
    @art = Art.find(params[:id])
    @user = current_user
    if @art.destroy
      flash[:notice] = "Post deleted"
      redirect_to arts_path
    end
  end

  private

  def art_params
    params.require(:art).permit(:title, :description, :user_id, :photo, :category)
  end

  def art_params_update
    params.require(:art).permit(:title, :description, :photo, :user_id, :category)
  end

end
