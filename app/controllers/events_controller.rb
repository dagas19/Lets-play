class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    unless @stimulus_reflex
      if @events
        @events = policy_scope(@events)
      else
        @events = policy_scope(Event)
      end
    end
    @markers = @events.map do |event|
      {
        lat: event.venue.latitude,
        lng: event.venue.longitude,
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

  def event_params
    params.require(:event).permit(:title, :date, :spots, :description, :experience_level, :min_age, :max_age, :game_id, :venue_id, :gender_id)
  end

  def map(events)
        @markers = events.map do |event|
      {
        lat: event.venue.latitude,
        lng: event.venue.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event })
      }
    end
  end
end
