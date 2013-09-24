class AddAverageRatingToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :average_rating, :integer
  end
end
