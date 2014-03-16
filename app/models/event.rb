class Event < ActiveRecord::Base
  def short_name
    if @short_name.nil?
      max_length = 40
      if name.length > max_length
        @short_name = name[0..max_length][0..-3] + "..."
      else
        @short_name = name
      end
    end
    @short_name
  end
end
