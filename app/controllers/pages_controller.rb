class PagesController < ApplicationController

  def home
    @event = Event.last
  end

  def youth
  end

  def blog
    @posts = BloggerService.new.get_posts
  end

end
