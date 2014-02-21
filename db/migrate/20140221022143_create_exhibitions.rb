class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :name
      t.datetime :submission_start
      t.datetime :submission_end

      t.timestamps
    end
  end
end
