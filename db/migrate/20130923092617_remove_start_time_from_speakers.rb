class RemoveStartTimeFromSpeakers < ActiveRecord::Migration
  def change
  	if  column_exists? :speakers, :start_time
  		remove_column :speakers, :start_time
  	end
	
	if column_exists? :speakers, :end_time
		remove_column :speakers, :end_time
	end
  end
end
