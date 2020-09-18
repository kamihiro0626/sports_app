class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  mount_uploader :movie, MovieUploader

  belongs_to :user

  with_options presence: true do
    validates :title
    validates :content
    validates :category_id
    validates :movie
  end

  validates :category_id, numericality: { other_than: 1 }
end
