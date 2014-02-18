class AddArtistToSubmissions < ActiveRecord::Migration
  def change
    add_reference :submissions, :artist, index: true
  end
end
