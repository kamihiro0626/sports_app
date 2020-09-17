class UsersController < ApplicationController
before_action :move_to_index

  def show
    @nickname = current_user.nickname
    @posts = current_user.posts
  end

  private

  def move_to_index
    
  end
end
