class AddLanguageToSpeaker < ActiveRecord::Migration
  def change
    add_column :speakers, :language, :string
  end
end
