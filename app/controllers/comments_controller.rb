class CommentsController < ApplicationController
 
  def create
    comment = Comment.create(comment_params)
    redirect_to "/posts/#{comment.post.id}"
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to posts_path
  end


  private

  def comment_params
    params.require(:comment)
          .permit(:text)
          .merge(user_id: current_user.id, post_id: params[:post_id])
  end

end
