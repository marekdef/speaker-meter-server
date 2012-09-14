class ChangeDataTypeForDescription < ActiveRecord::Migration
  def up
	change_column :speakers, :description, :text, :limit => 1024
  end

  def down
	change_column :speakers, :description, :string
  end
end
