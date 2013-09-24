class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.text :comment
      t.integer :speaker_id
      t.timestamps
    end
  end
end
