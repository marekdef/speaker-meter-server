class Rating < ActiveRecord::Base
  attr_accessible :comment, :rating, :speaker_id
  belongs_to :speaker
  validates :rating, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5 }
end
