class EventAttendingsController < ApplicationController
  def new
    @attendee = EventAttending.new
  end

  def create
    @attendee = EventAttending.new(event_attending_params)

    if @attendee.save
      redirect_to event_path(@attendee.event_id), notice: "You have successfully registered for the event!"
    else
      redirect_back fallback_location: events_path, alert: "Unable to register for the event"
    end
  end

  private

  def event_attending_params
    params.permit(:event_id, :event_attendee_id)
  end
end
