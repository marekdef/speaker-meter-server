class AgendaController < ApplicationController
  # GET /speakers
  # GET /speakers.json
  def index
    @venues = Venue.order(:name)
    times = TimeSlot.all(:order => 'start_time, end_time')
    speakers = Speaker.joins(:timeslot, :venue).order(:start_time, :end_time, "venues.name")
    @agenda = Hash.new()

    times.each { |time|
      @agenda[time.id] = Array.new()
      @venues.each { |venue|

        sp = speakers.select{ |speaker| 
          speaker.venue == venue and speaker.timeslot.start_time == time.start_time
        }[0]

        if sp.nil? and Speaker.where(:time_slot_id => time.id).length > 0
          @agenda[time.id].push(Speaker.where(:time_slot_id => time.id)[0])
        else
          @agenda[time.id].push(sp)
        end
      }
    }

    respond_to do |format|
      format.html
      format.json do
        render json: @agenda
      end
    end
  end
end
