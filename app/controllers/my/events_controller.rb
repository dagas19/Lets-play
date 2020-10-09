class My::EventsController < ApplicationController

  def index
    @events = policy_scope([:my, Event.where(user: current_user)])
    @participations = policy_scope([:my, Registration.where(user: current_user)])
  end
end
