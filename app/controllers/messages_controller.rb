class MessagesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @message = Message.new(message_params)
    @message.event = @event
    @message.user = current_user
    authorize @message
    if @message.save
      EventChannel.broadcast_to(
        @event,
        render_to_string(partial: "message", locals: { message: @message })
      )
      respond_to do |f|
        f.html { redirect_to event_path(@event, anchor: "message-#{@message.id}") }
        f.js { head :no_content }
      end
    else
      render "events/show"
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end

end
