class TimeSlot < ActiveRecord::Base
  attr_accessible :end_time, :start_time
  belongs_to :speakers

  validates_uniqueness_of :start_time, :scope => :end_time


  def to_s
	return self.start_time.strftime("%H:%M") + "-" + self.end_time.strftime("%H:%M")
  end
end
