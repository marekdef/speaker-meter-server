class RemoveStartTimeFromSpeakers < ActiveRecord::Migration
  def change
	remove_column :speakers, :start_time
	remove_column :speakers, :end_time
  end
end
