class ChangeSpekaer < ActiveRecord::Migration
  def up
    change_table :speakers do |t|
      t.change :bio, :text
      t.change :presentation, :text
    end	
  end

  def down
   change_table :speakers do |t|
      t.change :bio, :string
      t.change :presentation, :string
    end	

  end
end
