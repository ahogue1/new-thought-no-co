class EventsController < ApplicationController

  def index
    @events = Event.where(event_type: "event").where('end_date >= ?', Date.today)
  end

  def show
    @event = Event.find(params[:id])
    @registration = Registration.new
  end

  def classes
    @classes = Event.where(event_type: "class").where('end_date >= ?', Date.today)
  end
end
