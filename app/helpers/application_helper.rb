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
    selector = 'div.newsline_item'
    page.css(selector).each do |el|
         puts el.text
    end
  end
end
