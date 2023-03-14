# frozen_string_literal: true

class AddColumnsToTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.date :time
      t.datetime :done_at
    end
  end
end
