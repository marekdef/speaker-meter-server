class Speaker < ActiveRecord::Base
  LANGUAGES = ['English', 'Polish']
  attr_accessible :name
  attr_accessible :presentation
  attr_accessible :description
  attr_accessible :visible
  attr_accessible :bio
  attr_accessible :timeslot
  attr_accessible :time_slot_id
  attr_accessible :language
  attr_accessible :average_rating
  attr_accessible :venue
  attr_accessible :venue_id

  #validates_inclusion_of :venue, :in => VENUES, :allow_nil => true, :allow_blank => true
  validates_inclusion_of :language, :in => LANGUAGES, :allow_nil => false, :allow_blank => false
  validates_presence_of :name, :presentation, :description, :bio


  belongs_to :venue
  has_many :votes
  has_many :ratings, :after_add => :update_average_rating, :after_remove => :update_average_rating

  belongs_to :timeslot, :class_name => "TimeSlot", :foreign_key => "time_slot_id"

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
      :end_time => self.end_time, 
      :venue => self.venue.name,
      :venue_id => self.venue.id,
      :language => self.language,
      :bio => self.bio,
      :description => self.description,
      :average_rating => self.average_rating,
      :visible => self.visible
   }
  end

  def start_time
	@time_slot = TimeSlot.find_by_id(self.time_slot_id)
	if @time_slot
		return @time_slot.start_time 
	end
  end

  def end_time
	@time_slot = TimeSlot.find_by_id(self.time_slot_id)
	if @time_slot
		return @time_slot.end_time 
	end
  end

  def update_average_rating(review=nil)
    s = self.ratings.sum(:rating)
    c = self.ratings.count
    self.update_attribute(:average_rating, c == 0 ? 0.0 : s / c.to_f)
  end
end
