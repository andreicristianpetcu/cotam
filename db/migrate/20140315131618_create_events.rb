class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :url
      t.references :event_data_source

      t.timestamps
    end
  end
end
