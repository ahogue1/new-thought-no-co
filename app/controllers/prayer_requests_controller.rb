class PrayerRequestsController < ApplicationController

  def index
    @prayer_requests = PrayerRequest.all
  end

  def create
    @prayer_request = PrayerRequest.new(prayer_request_params)

    if @prayer_request.save
      ContactMailer.prayer_request(@prayer_request).deliver_now
      redirect_to root_path, notice: "We've Received Your Prayer Request"
    else
      render :new
    end
  end

  def new
    @prayer_request = PrayerRequest.new
  end

  private

  def prayer_request_params
    params.require(:prayer_request).permit(:name, :email, :phone, :method, :content)
  end

end
