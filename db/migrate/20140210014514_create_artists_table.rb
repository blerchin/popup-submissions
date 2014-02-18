class CreateArtistsTable < ActiveRecord::Migration
  def change
    create_table :artists_tables do |t|
      t.string :artists
    end
  end
end
