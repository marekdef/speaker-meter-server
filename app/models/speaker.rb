class Speaker < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :presentation
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
      :last_voted => @updated_at
    }
  end
end
