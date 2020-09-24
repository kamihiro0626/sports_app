class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :posts, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :likes
   has_many :favorites, dependent: :destroy
   has_many :fav_posts, through: :favorites, source: :post

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end 
end
