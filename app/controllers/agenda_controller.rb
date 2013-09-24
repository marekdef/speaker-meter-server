class AgendaController < ApplicationController
  # GET /speakers
  # GET /speakers.json
  def index
    @venues = Speaker.all(:group => 'venue', :select => 'venue')
    times = TimeSlot.all(:order => 'start_time, end_time')
    speakers = Speaker.joins(:timeslot).order(:start_time, :end_time, :venue)
    @agenda = Hash.new()

    times.each { |time|
      @agenda[time.id] = Array.new()
      @venues.each { |venue|
        @agenda[time.id].push(speakers.select{ |speaker| 
          speaker.venue == venue.venue and speaker.timeslot.start_time == time.start_time
        })
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
