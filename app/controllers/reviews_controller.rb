class ReviewsController < ApplicationController
  def index
    @user = current_user
    @reviews = Review.where(user_id: current_user.id)
  end

  def show
    @user = current_user
    @review = Review.find(params[:id])
  end

  def new
    @user = current_user
    @art = Art.find(params[:art_id])
    @review = current_user.reviews.new
  end

  def create
    @user = current_user
    @review = current_user.reviews.new(review_params)
    @art = Art.find(params[:art_id])
    @review.art_id = @art.id

    if @review.save
      flash[:notice] = "comment posted"
      redirect_to art_path(@art)
    else
      flash[:notice] = "Something went wrong"
    end
  end

  def edit
    @review = Review.find(params[:id])
    @user = current_user
  end

  def update
    @user = current_user
    @review = Review.find(params[:id])
      if @review.update(review_params_update)
        flash[:notice] = "post updated"
        redirect_to art_path(@review.art)
      else
        render :edit
      end

  end

  def destroy
    @user = current_user
    @review = Review.find(params[:id])
    @art = @review.post
    @art.user_id = current_user.id

    if @review.destroy
      flash[:notice] = "Post deleted"
      redirect_to art_path(@review.art)
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :art_id, :user_id)
  end

  def review_params_update
    params.require(:review).permit(:content, :art_id, :user_id)
  end
end
