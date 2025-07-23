class EventAttendingsController < ApplicationController
  def new
    @attendee = EventAttending.new
  end

  def create
    @attendee = current_user.attended_event.build(attend_params)

    if @attendee.save
      redirect_to @attendee, notice: "You have successfully registered for the event!"
    else
      flash.now[:error] = "Unable to register for the event"
      render :new
    end
  end
end
