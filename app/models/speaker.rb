class Speaker < ActiveRecord::Base
  attr_accessible :name
  has_many :votes

  def as_json(options = {})
    @votes_down = self.votes.where({:isup => false}).count
    @votes = self.votes.count
    @votes_up = @votes - @votes_down
    {
      :id => self.id,
      :name => self.name,
      :votes => @votes,
      :votes_up => @votes_up
    }
  end
end
