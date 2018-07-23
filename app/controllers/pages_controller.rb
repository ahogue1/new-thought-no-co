class PagesController < ApplicationController

  def about
  end

  def be_of_service
  end

  def blog
    @posts = BloggerService.new.get_posts
  end

  def calendar
  end

  def give
  end

  def home
    @event = Event.
      where(event_type: "event").
      where('start_date >= ?', Date.today).
      order(:start_date).
      first
  end

  def who_we_are
  end

  def venue
  end

  def youth
  end

end
