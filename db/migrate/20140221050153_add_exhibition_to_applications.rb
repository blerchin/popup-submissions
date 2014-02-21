class AddExhibitionToApplications < ActiveRecord::Migration
  def change
    add_reference :applications, :exhibition, index: true
  end
end
