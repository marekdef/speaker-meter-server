class SpeakersController < ApplicationController
  before_filter :authorize, :only => [ :new, :edit, :destroy, :update, :clear ]
  # GET /speakers
  # GET /speakers.json
  def index
    @speakers = Speaker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json do
          render json: @speakers.to_json({:only => ['id', 'name'] })
        end
    end
  end

  # GET /speakers/1
  # GET /speakers/1.json
  def show
    @speaker = Speaker.find(params[:id])

    respond_to do |format|
      format.html
        @votes_down = Vote.where({:isup => false}).find_all_by_speaker_id(params[:id])
        @votes = Vote.find_all_by_speaker_id(params[:id])
        @votes_up = @votes - @votes_down
	@ratings = @speaker.ratings
        # show.html.erb
      format.json do
        render json: @speaker.to_json()
      end
    end
  end

  # GET /speakers/new
  # GET /speakers/new.json
  def new
    @speaker = Speaker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @speaker }
    end
  end

  # GET /speakers/1/edit
  def edit
    @speaker = Speaker.find(params[:id])
  end

  # POST /speakers
  # POST /speakers.json
  def create
    @speaker = Speaker.new(params[:speaker])

    respond_to do |format|
      if @speaker.save
        format.html { redirect_to @speaker, notice: "Speaker #{@speaker.name} was successfully created." }
        format.json { render json: @speaker, status: :created, location: @speaker }
      else
        format.html { render action: "new" }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /speakers/1
  # PUT /speakers/1.json
  def update
    @speaker = Speaker.find(params[:id])

    respond_to do |format|
      if @speaker.update_attributes(params[:speaker])
        format.html { redirect_to @speaker, notice: "Speaker #{@speaker.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /speakers/1
  # DELETE /speakers/1.json
  def destroy
    @speaker = Speaker.find(params[:id])
    @speaker.destroy

    respond_to do |format|
      format.html { redirect_to speakers_url }
      format.json { head :no_content }
    end
  end

  def voteup
    set_cookie
    @vote = Vote.new
    @vote.isup = true
    @vote.speaker = Speaker.find(params[:id])
    @vote.uuid = cookies[:uuid].to_s
    @vote.save
    redirect_to speaker_path(params[:id])
  end

  def votedown
    set_cookie
    @vote = Vote.new
    @vote.isup = false
    @vote.speaker = Speaker.find(params[:id])
    @vote.uuid = cookies[:uuid].to_s
    @vote.save
    redirect_to speaker_path(params[:id])
  end

  def clear
    @speaker = Speaker.find(params[:id])
    @speaker.votes.delete_all()
    redirect_to speaker_path(params[:id])
  end

  def set_cookie
    if cookies[:uuid].nil?
       cookies[:uuid] = UUIDTools::UUID.random_create().to_s
    end
  end

  def authorize
    if session[:user_id].nil?
      redirect_to sessions_new_path
    end
  end

  def rate
	if not params[:rating].nil?
	  r = Rating.new(params[:rating])
	  r.save
	end
	redirect_to speaker_path
  end
end
