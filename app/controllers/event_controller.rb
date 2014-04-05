class EventController < ApplicationController
  respond_to :json

  def index
    @events = Event.where("visible = true").order(created_at: :desc).limit(12)
  end
  
  def show
    @event = Event.find(params[:id])
    respond_with(@event)
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.xml  { render :xml => @event }
    #   format.json { render :json => @event }
    # end
  end
end
