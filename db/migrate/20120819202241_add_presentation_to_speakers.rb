class AddPresentationToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :presentation, :string, :null => false, :default => ""
  end
end
