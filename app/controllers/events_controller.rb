class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    @events = policy_scope(Event)
    @events = Event.all
  end
end
