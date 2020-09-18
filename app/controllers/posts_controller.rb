class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update]


  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  def edit
    
  end

  def update

  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :content, 
      :category_id,
      :movie 
      ).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end