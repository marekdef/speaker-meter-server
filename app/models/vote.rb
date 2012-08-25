class Vote < ActiveRecord::Base
  belongs_to :speaker
  attr_accessible :isup
  attr_accessible :uuid
  validates_inclusion_of :isup, :in => [true, false]
end
