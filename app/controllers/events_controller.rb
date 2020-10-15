class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
      if @events
        raise
        @events = policy_scope(@events)
      else
        @events = policy_scope(Event)
      end
    @markers = @events.map do |event|
      {
        lat: event.venue.latitude,
        lng: event.venue.longitude,
        gameType: event.game.game_type,
        timeType: event.time_type,
        infoWindow: render_to_string(partial: "events/info_window", locals: { event: event })
      }
    end
  end

  def show
    @message = Message.new
    @event = Event.find(params[:id])
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    if @event.save
      redirect_to my_events_path
    else
      flash[:danger] = @event.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :spots, :description, :experience_level, :min_age, :max_age, :game_id, :venue_id)
  end
end
