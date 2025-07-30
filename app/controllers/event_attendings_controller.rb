class EventAttendingsController < ApplicationController
  def new
    @attendee = EventAttending.new
  end

  def create
    @attendee = EventAttending.new(event_attendee_id: params[:event_id], attended_event_id: params[:user_id])

    if @attendee.save
      redirect_to event_path(@attendee.attended_event_id), notice: "You have successfully registered for the event!"
    else
      redirect_back fallback_location: events_path, alert: "Unable to register for the event"
    end
  end
end
