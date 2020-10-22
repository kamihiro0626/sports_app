class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

   has_many :posts, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :likes, dependent: :destroy
   has_many :favorites, dependent: :destroy
   has_many :fav_posts, through: :favorites, source: :post
   has_many :sns_credentials

   def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
   # sns認証したことがあればアソシエーションで取得
   # 無ければemailでユーザー検索して取得orビルド(保存はしない)
   user = User.where(email: auth.info.email).first_or_initialize(
   nickname: auth.info.name,
      email: auth.info.email
  )
   # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
   if user.persisted?
    sns.user = user
    sns.save
   end
    { user: user, sns: sns }
   end

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
