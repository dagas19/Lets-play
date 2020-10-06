class User::EventsController < ApplicationController
  def new
    @event = Event.new
    authorize [:user, @event]
  end
  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize [:user, @event]
    if @event.save
      redirect_to user_events_path
    else
      flash[:danger] = @event.errors.full_messages.join(', ')
      render :new
    end
  end

  def event_params
    params.require(:event).permit(:title, :date, :spots, :description, :experience_level, :min_age, :max_age)
  end
end
