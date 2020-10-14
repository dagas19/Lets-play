class My::EventsController < ApplicationController

  def index
    @events = policy_scope([:my, Event.where(user: current_user)])
    @participations = policy_scope([:my, Registration.where(user: current_user)])
    group_events(@events, @participations)
    @events = @all_events
    @message = Message.new
  end

  private

  def group_events(events1, events2)
    @all_events = []
    events1.each do |event|
      @all_events <<  event
    end
    events2.each do |par|
      @all_events <<  par.event
    end
    @all_events
  end
end
