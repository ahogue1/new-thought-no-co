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

  def create_registration
    @registration = Registration.new(registration_params)
    @event = Event.find(params[:registration][:event_id])

    if @registration.save
      redirect_to events_path, notice: "Registration Completed"
    else
      flash.now[:alert] = "Registration Couldn't be completed, please check errors below"
      render :show
    end

  end

  private

  def registration_params
    params.require(:registration).permit(:first_name, :last_name, :email, :phone, :comment, :event_id)
  end

end
