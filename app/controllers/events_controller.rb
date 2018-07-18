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
    @registration.amount = @event.general_price

    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @registration.amount_cents,
      description:  "Payment for class #{@event.title}",
      currency:     @registration.amount.currency
    )

    @registration.payment = charge.to_json
    @registration.state = 'paid'

    if @registration.save
      redirect_to events_path, notice: "Registration Completed"
    else
      flash.now[:alert] = "Registration Couldn't be completed, please check errors below"
      render :show
    end

  rescue Stripe::CardError => e
    flash.now[:alert] = "Registration Couldn't be completed, please check errors below"
    render :show
  end

  private

  def registration_params
    params.require(:registration).permit(:first_name, :last_name, :email, :phone, :comment, :event_id)
  end

end
