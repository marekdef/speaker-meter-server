class AddVenueToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :venue, :text
  end
end
