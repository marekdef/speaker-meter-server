class RemoveConstraintsFromSpeaker < ActiveRecord::Migration
  def up
	remove_index :speakers, :column => :name 
  end

  def down
	add_index :speakers, :name, :unique => true
  end
end
