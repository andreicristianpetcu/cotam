require 'nokogiri'

module ApplicationHelper
  def self.generate_events(event_data_source)
    page = download_page(event_data_source)
    #download page
    #parse page
    #check if each event is duplicate
    #return onlyuniqueevents
  end

  def self.download_page(event_data_source)
    page_url = event_data_source.url
    page = Nokogiri::HTML(open(page_url))
    item_selector = 'div.newsline_item'
    name_selector = 'h3 a'
    page.css(item_selector).each do |item|
      e = Event.new
      e.name = item.css(name_selector)[0].text
      e.url = item.css(name_selector)[0]["href"]
      e.save
    end
  end
end
