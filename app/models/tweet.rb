# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  validates :time, presence: true
  validates :title, presence: true
end
