class PagesController < ApplicationController

  def about
  end


  def blog
    @posts = BloggerService.new.get_posts
  end

  def give
  end

  def home
    @event = Event.last
  end

  def staff
  end

  def venue
  end

  def youth
  end

end
