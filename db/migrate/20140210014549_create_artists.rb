class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :artists
    end
  end
end
