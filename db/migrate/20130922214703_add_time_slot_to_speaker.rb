class AddTimeSlotToSpeaker < ActiveRecord::Migration
  def change
    add_column :speakers, :time_slot_id, :integer
  end
end
