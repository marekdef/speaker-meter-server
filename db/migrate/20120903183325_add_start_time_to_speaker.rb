class AddStartTimeToSpeaker < ActiveRecord::Migration
  def change
    add_column :speakers, :start_time, :time
    add_column :speakers, :end_time, :time
  end
end
