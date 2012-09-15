class ChangeStartTimeEndTimeInSpeaker < ActiveRecord::Migration
def change
  rename_column :speakers, :start_time, :start_time_bak
  rename_column :speakers, :end_time, :end_time_bak
  add_column :speakers, :start_time, :date
  add_column :speakers, :end_time, :date

  Speaker.reset_column_information
  Speaker.find_each { |s| s.update_attribute(:start_time, s.start_time_bak) } 
  Speaker.find_each { |s| s.update_attribute(:end_time, s.end_time_bak) } 
  remove_column :speakers, :start_time_bak
  remove_column :speakers, :end_time_bak
end
end
