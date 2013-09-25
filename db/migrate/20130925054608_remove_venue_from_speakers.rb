class RemoveVenueFromSpeakers < ActiveRecord::Migration
  def change
	remove_column :speakers, :venue
  end
end
