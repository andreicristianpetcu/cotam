class EventController < ApplicationController
  respond_to :json

  def index
    @events = Event.where("visible = true").order(created_at: :desc).limit(12)
  end
  
  def new
    @event = Event.new
  end

  def create
    @event = Event.new params[:event]
    if @event.save
      redirect_to events_path
    else
      render :action => 'new'
    end
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
