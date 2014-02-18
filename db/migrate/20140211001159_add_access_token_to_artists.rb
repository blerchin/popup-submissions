class AddAccessTokenToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :access_token, :string
  end
end
