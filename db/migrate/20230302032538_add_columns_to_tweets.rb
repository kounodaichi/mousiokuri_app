class AddColumnsToTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.date :time 
      t.datetime :done_at 
      t.timestamps
    end
  end
end
