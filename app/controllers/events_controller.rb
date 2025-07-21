class EventsController < ApplicationController
  before_action :authenticate_user!
  def index
    @event = Event.all
  end
end
