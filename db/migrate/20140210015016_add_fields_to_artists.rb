class AddFieldsToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :first_name, :string
    add_column :artists, :last_name, :string
    add_column :artists, :email, :string
    add_column :artists, :contact_city, :string
    add_column :artists, :contact_state, :string
    add_column :artists, :contact_postal, :string
    add_column :artists, :contact_address_one, :string
    add_column :artists, :contact_address_two, :string
  end
end
