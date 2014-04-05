require 'nokogiri'

module ApplicationHelper
  def self.generate_events(event_data_source)
    if event_data_source.nil?
      event_data_source = EventDataSource.first
    end
    #check if each event is duplicate
    #return onlyuniqueevents
  end

  def self.download_page(event_data_source)
    page_url = event_data_source.url
    page = Nokogiri::HTML(open(page_url))
    item_selector = event_data_source.item_selector
    name_selector = event_data_source.name_selector
    page.css(item_selector).each do |item|
      e = Event.new
      e.name = item.css(name_selector)[0].text
      e.url = item.css(name_selector)[0]["href"]
      old = Event.find_by_url(e.url)
      if old == nil then
        e.save
      end
    end
  end
end
