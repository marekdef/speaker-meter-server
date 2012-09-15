class Speaker < ActiveRecord::Base
  VENUES = ['F2', 'F3', 'F4', 'F10']
  attr_accessible :name
  attr_accessible :presentation
  attr_accessible :start_time
  attr_accessible :end_time
  attr_accessible :venue
  attr_accessible :description
  attr_accessible :visible

  validates_inclusion_of :venue, :in => VENUES, :allow_nil => true, :allow_blank => true
  validates_presence_of :start_time, :end_time

  has_many :votes

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
      :venue => self.venue,
      :description => self.description,
      :visible => self.visible
   }
  end
end
