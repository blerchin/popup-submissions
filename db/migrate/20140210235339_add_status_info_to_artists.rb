class AddStatusInfoToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :status, :string
    add_column :artists, :created_at, :datetime
    add_column :artists, :modified_at, :datetime
  end
end
