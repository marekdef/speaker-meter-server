class AddVenueIdToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :venue_id, :integer
  end
end
