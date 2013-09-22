class AddBioToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :bio, :string
  end
end
