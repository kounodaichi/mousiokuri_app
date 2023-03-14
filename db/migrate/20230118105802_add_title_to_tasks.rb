# frozen_string_literal: true

class AddTitleToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :title, :string
  end
end
