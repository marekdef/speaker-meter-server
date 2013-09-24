class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.text :name, :limit=>nil

      t.timestamps
    end
    add_index :speakers, :name, :unique => true
  end
end
