class Event < ActiveRecord::Base
  def short_name
    if @short_name.nil?
      max_length = 50
      if name.length > max_length
        @short_name = name[0..50][0..-3] + "..."
      else
        @short_name = name
      end
    end
    @short_name
  end
end
