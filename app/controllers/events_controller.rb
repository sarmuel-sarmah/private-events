class EventsController < ApplicationController
  before_action :authenticate_user!
  def index
    @event = Event.all
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.build(params[:event])
  end
end
