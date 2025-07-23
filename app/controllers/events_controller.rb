class EventsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  def index
    @event = Event.all
  end

  def new
    @event = current_user.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: "Event was succcessfully created."
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.expect(:title, :description, :date)
  end
end
