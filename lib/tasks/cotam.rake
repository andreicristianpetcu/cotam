namespace :cotam do
  desc "Generates events from the event sources"
  task generate_events: :environment do
    ApplicationHelper.generate_events(nil)
  end

end
