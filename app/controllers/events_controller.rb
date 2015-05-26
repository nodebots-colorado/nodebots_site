class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)

    if event.save!
      redirect_to admin_path
    end
  end

  def add_attendee
    event = Event.find(params[:id])

    if already_rsvpd?(event)
      redirect_to :back, alert: "You've already RSVP'd for #{event.title}."
    else
      attendee = Attendee.new
      attendee.event_id = event.id
      attendee.user_id = current_user.id
      attendee.save!

      event.attendees << attendee
      redirect_to :back, notice: "You have successfully RSVP'd for #{event.title}!"
    end
  end

  private

  def already_rsvpd?(event)
    event.attendees.any? {|a| a.user_id == current_user.id }
  end
  
  def event_params
    params.require(:event).permit( :title,
                                   :description,
                                   :location,
                                   :time
                                 )
  end 

end