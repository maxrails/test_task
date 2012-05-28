class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.text :languages
      t.datetime :started_at
      t.datetime :ended_at
      t.string :start_timezone
      t.string :end_timezone
      t.text :regions
      t.integer :brend_id

      t.timestamps
    end
  end
end
