class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :favorited_users, through: :favorites, source: :user
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.any? { |favorite| favorite.user_id == user.id }
  end
  mount_uploader :image, ImageUploader
end
