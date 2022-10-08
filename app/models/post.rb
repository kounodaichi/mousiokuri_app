class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :favorited_users, through: :favorites, source: :user
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
  # has_many_attached :images
  # belongs_to :user, optional: true
  def favorited_by?(user)
    favorites.any? { |favorite| favorite.user_id == user.id }
  end
end
