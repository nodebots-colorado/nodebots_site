class PagesController < ApplicationController

  def index
    @event = Event.last
  end

  def organizers
  end

end