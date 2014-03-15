class CreateEventDataSources < ActiveRecord::Migration
  def change
    create_table :event_data_sources do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
