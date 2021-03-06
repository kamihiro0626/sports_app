class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :search_post, only: [:index, :search]

  def index
    @posts = Post.all.includes(:user).order("created_at DESC") 
    set_category_column
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    
  end

  def update
    if@post.update(post_params)
       redirect_to post_path
    else
       render :edit
    end
  end
 
   def destroy
     if @post.destroy
       redirect_to posts_path
     else
       render :show
     end
   end

 def favorites
    @posts = current_user.favorites_posts.includes(:user).recent
 end

 def search
  @results = @p.result.includes(:category)  # 検索条件にマッチした投稿の情報を取得
 end

 def set_category_column
  @category_name = Category.select("name").distinct
 end
#  def previous
#   Post.where("id < ?",id).order("id DESC").publish.first
# end

# def next
#   Post.where("id > ?", id).order("id ASC").publish.first
# end

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

  def search_post
    @p = Post.ransack(params[:q])  # 検索オブジェクトを生成
  end
end