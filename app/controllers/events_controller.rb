class EventsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  def index
    @events = Event.all.order(created_at: :desc)
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: "Event was succcessfully created."
    else
      flash.now[:error] = "Event creation failed!"
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    render :show
  end

  private
  def event_params
    params.expect(:title, :description, :date)
  end
end
