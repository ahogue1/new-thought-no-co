class PrayerRequestsController < ApplicationController

  def index
    @prayer_requests = PrayerRequest.all
  end

  def create
    @prayer_request = PrayerRequest.new(prayer_request_params)
  end

  def new
     @prayer_request = PrayerRequest.new
   end

end