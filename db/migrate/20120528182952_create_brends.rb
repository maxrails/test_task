class CreateBrends < ActiveRecord::Migration
  def change
    create_table :brends do |t|
      t.string :name
      t.integer :company_id

      t.timestamps
    end
  end
end
