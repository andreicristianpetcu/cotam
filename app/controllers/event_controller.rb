class EventController < ApplicationController
  def index
    @events = Event.last(12).reverse
  end
end
