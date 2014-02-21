class AddArtistToApplications < ActiveRecord::Migration
  def change
    add_reference :applications, :artist, index: true
  end
end
