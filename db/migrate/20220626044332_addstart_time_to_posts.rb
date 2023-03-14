# frozen_string_literal: true

class AddstartTimeToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :start_time, :datetime
  end
end
