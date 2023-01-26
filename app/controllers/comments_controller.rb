class CommentsController < ApplicationController
  def index
    @user = current_user
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @user = current_user
    @art = Art.find(params[:art_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @comment = Comment.new(comment_params)
    @comment.art = @art

    if @comment.save
      flash[:notice] = "comment posted"
      redirect_to dashboard_path
    else
      flash[:notice] = "Something went wrong"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @user = current_user
  end

  def update
    @comment = Comment.find(params[:id])
    @user = current_user

    if @comment.update(comment_params_update)
      flash[:notice] = "comment updated"
      redirect_to dashboard
    else
      render :edit
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    @user = current_user
    if @comment.destroy
      flash[:notice] = "comment deleted"
      redirect_to dashboard
    end
  end



  private

  def comment_params
    params.require(:comment).permit(:content, :art_id, :user_id)
  end

  def comment_params_update
    params.require(:comment).permit(:content, :art_id, :user_id)
  end
end
