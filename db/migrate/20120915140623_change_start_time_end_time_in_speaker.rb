class ChangeStartTimeEndTimeInSpeaker < ActiveRecord::Migration
  def change
	change_column :speakers, :start_time,:date
	change_column :speakers, :end_time,:date
  end
end
