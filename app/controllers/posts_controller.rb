class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      flash[:notice] = "post created"
      redirect_to posts_path
    else
      flash[:notice] = "Something went wrong, please check the form again"
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user = current_user
  end

  def update
    @post = Post.find(params[:id])
    @user = current_user
    @post.update(post_params_update)
    redirect_to post(@post) if @post.update
  end

  def destroy
    @post = Post.find(params[:id])
    @user = current_user
    if @post.update(post_params_update)
      flash[:notice] = "post updated"
      redirect_to posts_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :user_id, :photo)
  end

  def post_params_update
    params.require(:post).permit(:title, :description, :photo)
  end

end
