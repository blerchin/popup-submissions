class AddMoreFieldsToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :phone, :string
  end
end
