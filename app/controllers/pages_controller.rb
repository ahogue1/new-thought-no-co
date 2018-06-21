class PagesController < ApplicationController

  def home
    @event = Event.last
  end

  def youth
  end

end
