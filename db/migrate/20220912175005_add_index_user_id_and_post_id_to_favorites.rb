# frozen_string_literal: true

class AddIndexUserIdAndPostIdToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_index :favorites, %i[user_id post_id], unique: true
  end
end
