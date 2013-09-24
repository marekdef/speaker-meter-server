class AgendaController < ApplicationController
  # GET /speakers
  # GET /speakers.json
  def index
    @venues = Speaker.all(:group => 'venue', :select => 'venue')
    times = Speaker.all(:group => 'start_time, end_time', :select => 'start_time, end_time')
    speakers = Speaker.all(:order => 'venue, start_time, end_time')
    @agenda = Hash.new()
    @timesH = Hash.new()

    times.each { |time|
      @agenda[time.start_time.strftime("%H:%M")] = Array.new()
      @timesH[time.start_time.strftime("%H:%M")] = time
      @venues.each { |venue|
        @agenda[time.start_time.strftime("%H:%M")].push(speakers.select{ |speaker| 
          speaker.venue == venue.venue and speaker.start_time == time.start_time
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
