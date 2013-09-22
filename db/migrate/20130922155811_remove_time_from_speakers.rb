class RemoveTimeFromSpeakers < ActiveRecord::Migration
  def up
    remove_column :speakers, :start_time
    remove_column :speakers, :end_time
  end

  def down
    add_column :speakers, :end_time, :time
    add_column :speakers, :start_time, :time
  end
end
