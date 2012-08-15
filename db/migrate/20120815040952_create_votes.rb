class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :isup
      t.belongs_to :speaker

      t.timestamps
    end
    add_index :votes, :speaker_id
  end
end
