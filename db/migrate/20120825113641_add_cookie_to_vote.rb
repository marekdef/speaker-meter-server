class AddCookieToVote < ActiveRecord::Migration
  def change
    add_column :votes, :uuid, :string
  end
end
