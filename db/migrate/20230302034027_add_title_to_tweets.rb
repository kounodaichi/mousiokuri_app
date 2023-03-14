# frozen_string_literal: true

class AddTitleToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :title, :string
  end
end
