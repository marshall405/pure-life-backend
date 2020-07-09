class CreateTimeslots < ActiveRecord::Migration[6.0]
  def change
    create_table :timeslots do |t|
      t.integer :provider_id
      t.integer :day
      t.integer :hour
      t.boolean :available, default: :false

      t.timestamps
    end
  end
end
