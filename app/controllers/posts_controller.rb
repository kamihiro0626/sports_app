class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update]


  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    
  end

  def show

  end

  def edit
    
  end

  def update

  end

  private

  def set_post
    @post = Post.new
  end
end
