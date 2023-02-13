class Task < ApplicationRecord
  belongs_to :user
  validates :time, presence: true
  validates :title, presence: true
end