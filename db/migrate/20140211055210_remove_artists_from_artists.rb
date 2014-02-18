class RemoveArtistsFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :artists, :string
  end
end
