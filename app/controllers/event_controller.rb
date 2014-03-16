class EventController < ApplicationController
  def index
    @events = Event.first(12)
  end
end
