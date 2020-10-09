class RegistrationsController < ApplicationController
  def create
    @registration = Registration.new(registration_params)
    @registration.user = current_user
    authorize @registration
    if @registration.save
      redirect_to my_events_path
    else
      flash[:alert] = 'You where not able to sign up for the event!'
    end
  end

  def registration_params
    params.permit(:event_id)
  end
end
