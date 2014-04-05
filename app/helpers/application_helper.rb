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
    puts "Checking Source " + event_data_source.name
    page_url = event_data_source.url
    page = Nokogiri::HTML(open(page_url))
    item_selector = event_data_source.item_selector
    name_selector = event_data_source.name_selector
    page.css(item_selector).each do |item|
      e = Event.new
      e.name = item.css(name_selector)[0].text.strip
      e.url = item.css(name_selector)[0]["href"].strip
      if !e.url.starts_with?("http") && !e.url.starts_with?("https") then
        e.url = page_url + e.url
      end
      old = Event.find_by_url(e.url)
      if old == nil then
        puts "Saved event " + e.name
        e.save!
      end
    end
  end
end
