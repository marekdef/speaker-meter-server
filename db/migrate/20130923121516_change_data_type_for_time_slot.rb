class ChangeDataTypeForTimeSlot < ActiveRecord::Migration
  def up
  	add_column :time_slots, :start_time_tmp, :datetime
  	add_column :time_slots, :end_time_tmp, :datetime
  	
  	TimeSlot.reset_column_information
  	TimeSlot.all.each do |time_slot|
	  time_slot.start_time_tmp = DateTime.parse(time_slot.start_time.to_s)
	  time_slot.end_time_tmp = DateTime.parse(time_slot.end_time.to_s)
	  time_slot.save
	end

	remove_column :time_slots, :start_time
	remove_column :time_slots, :end_time

	rename_column :time_slots, :start_time_tmp, :start_time
	rename_column :time_slots, :end_time_tmp, :end_time
  end

  def down
  	change_column :time_slots, :start_time, :time
  	change_column :time_slots, :end_time, :time
  end
end
