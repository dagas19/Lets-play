class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    @events = policy_scope(Event)
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
  end

end
