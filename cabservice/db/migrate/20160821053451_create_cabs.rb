class CreateCabs < ActiveRecord::Migration
  def change
    create_table :cabs do |t|
      t.string :number
      t.string :driver
      t.string :cab_type
      t.string :model
      t.float :cab_latitude
      t.float :cab_longitude
      t.datetime :end_time
      t.timestamps 
    end
  end
end
