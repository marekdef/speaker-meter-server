class AddVisibleToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :visible, :boolean
    for s in Speaker.all do
	s.visible = true
	s.save!
    end
  end
end
