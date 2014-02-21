class AddExhibitionToArtists < ActiveRecord::Migration
  def change
    add_reference :artists, :exhibition
  end
end
