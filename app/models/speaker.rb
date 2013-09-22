class Speaker < ActiveRecord::Base
  VENUES = ['F2', 'F3', 'F4', 'F10']
  attr_accessible :name
  attr_accessible :presentation
  attr_accessible :venue
  attr_accessible :description
  attr_accessible :visible
  attr_accessible :bio

  validates_inclusion_of :venue, :in => VENUES, :allow_nil => true, :allow_blank => true
  validates_presence_of :name, :presentation, :description, :bio

  has_many :votes
  belongs_to :timeslot

  def as_json(options = {})
    @votes_down = self.votes.where({:isup => false}).count
    @votes = self.votes.count
    @updated_at = self.votes.maximum(:created_at)
    @votes_up = @votes - @votes_down
    {
      :id => self.id,
      :name => self.name,
      :presentation => self.presentation,
      :votes_down => @votes_down,
      :votes_up => @votes_up,
      :last_voted => @updated_at,
      :start_time => self.start_time,
 #     :end_time => self.end_time, 
      :venue => self.venue,
      :bio => self.bio,
      :description => self.description,
      :visible => self.visible
   }
  end

  def start_time
	@time_slot = TimeSlot.find_by_id(self.timeslot_id)
	if @time_slot
		return @time_slot.start_time 
	end
  end

  def end_time
	@time_slot = TimeSlot.find_by_id(self.timeslot_id)
	if @time_slot
		return @time_slot.end_time 
	end
  end


end
