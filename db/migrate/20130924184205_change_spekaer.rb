class ChangeSpekaer < ActiveRecord::Migration
  def up
    change_table :speakers do |t|
      t.change :bio, :text, :limit => nil
      t.change :presentation, :text, :limit => nil
    end	
  end

  def down
   change_table :speakers do |t|
      t.change :bio, :string
      t.change :presentation, :string
    end	

  end
end
