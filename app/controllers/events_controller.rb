class EventsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  before_action :set_product, only: %i[ show edit update destroy ]
  def index
    @events = Event.all.order(created_at: :desc)
  end

  def new
    @event = Event.new
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
    @event = Event.includes(:attendees).find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = currrent_user.created_events.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "Event details have been updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private
  def event_params
    params.expect(event: [ :title, :desc, :date, :location ])
  end
end
