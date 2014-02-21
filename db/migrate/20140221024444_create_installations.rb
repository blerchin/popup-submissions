class CreateInstallations < ActiveRecord::Migration
  def change
    create_table :installations do |t|
      t.references :exhibition
      t.references :artist

      t.timestamps
    end
  end
end
