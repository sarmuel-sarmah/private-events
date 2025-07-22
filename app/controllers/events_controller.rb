class EventsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  def index
    @event = Event.all
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event, notice: "Event was succcessfully created."
    else
      render :new
    end
  end

  private
  def event_params
    params.expect(:title, :description, :date)
  end
end
