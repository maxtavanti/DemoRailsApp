class EventsController < ApplicationController
  
  include Pundit
  
  before_action :authenticate_user!
  
  before_action :set_event, only: [:show, :edit, :update, :destroy, :apply]
  
  after_action :verify_authorized

  # GET /events
  # GET /events.json
  def index
    @events = policy_scope(Event)
    
    authorize @events
  end

  # GET /events/1
  # GET /events/1.json
  def show
    authorize @event
  end

  # GET /events/new
  def new
    @event = Event.new
    
    authorize @event
  end

  # GET /events/1/edit
  def edit
    authorize @event
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    
    authorize @event
    
    # set owner user on create
    @event.user = current_user

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    
    authorize @event
    
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    
    authorize @event
    
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def apply
    authorize @event
    participation = @event.participations.new(:user => current_user)
    
    respond_to do |format|
      if participation.save
        format.html { redirect_to root_path, notice: "Thank to apply: #{@event.title}." }
      else
        format.html { redirect_to root_path, alert: "Samething was wrong please try again." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :date_start, :date_end)
    end
end
