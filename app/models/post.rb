class Post < ApplicationRecord
  mount_uploader :movie, MovieUploader

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  belongs_to :category

  with_options presence: true do
    validates :title
    validates :category_id
    validates :movie
  end

  validates :category_id, numericality: { other_than: 1 }

  def bookmark_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
