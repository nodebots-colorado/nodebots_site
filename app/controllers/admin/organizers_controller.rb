class Admin::OrganizersController < AdminController

  def index
    @event = Event.new
  end

end