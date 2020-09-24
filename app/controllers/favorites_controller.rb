class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.build(post_id: params[:post_id])
    favorite.save!
    redirect_to posts_path, success: t('.flash.favorite')
  end

  def destroy
    current_user.favorites.find_by(post_id: params[:post_id]).destroy!
    redirect_to posts_path, success: t('.flash.not_favorite')
  end
end
