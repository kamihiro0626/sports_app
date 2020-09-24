class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  mount_uploader :movie, MovieUploader

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  with_options presence: true do
    validates :title
    validates :content
    validates :category_id
    validates :movie
  end

  validates :category_id, numericality: { other_than: 1 }

  def bookmark_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
