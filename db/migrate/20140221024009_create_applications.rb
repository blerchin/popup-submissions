class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :exhibition
      t.references :artst

      t.timestamps
    end
  end
end
