class EventsController < ApplicationController

  def index
    @events = Event.where(event_type: "event").where('end_date >= ?', Date.today)
  end

  def show
    @event = Event.find(params[:id])
  end

end
