class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :posts, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :likes, dependent: :destroy
   has_many :favorites, dependent: :destroy
   has_many :fav_posts, through: :favorites, source: :post
  
   def self.guest
    find_or_create_by!(email: 'guest@example.com', nickname: 'guest') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end 
end
