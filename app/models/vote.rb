class Vote < ActiveRecord::Base
  belongs_to :speaker
  attr_accessible :isup
  validates_inclusion_of :isup, :in => [true, false]
end
