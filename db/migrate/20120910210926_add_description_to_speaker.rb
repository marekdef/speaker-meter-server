class AddDescriptionToSpeaker < ActiveRecord::Migration
  def change
	add_column :speakers, :description, :string
  end
end
