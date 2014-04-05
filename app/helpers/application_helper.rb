require 'nokogiri'

module ApplicationHelper
  def self.generate_events(event_data_source)
    if event_data_source.nil?
      EventDataSource.find_each do |eds|
        download_page(eds)
      end
    end
    #check if each event is duplicate
    #return onlyuniqueevents
  end

  def self.download_page(event_data_source)
    puts "Checking EDS " + event_data_source.to_s
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
        puts "saved " + e.to_yaml
        e.save!
      end
    end
  end
end
