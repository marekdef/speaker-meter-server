class ChangeDataTypeForTimeSlot < ActiveRecord::Migration
  def up
  	change_column :time_slots, :start_time, :datetime
  	change_column :time_slots, :end_time, :datetime
  end

  def down
  	change_column :time_slots, :start_time, :time
  	change_column :time_slots, :end_time, :time
  end
end
