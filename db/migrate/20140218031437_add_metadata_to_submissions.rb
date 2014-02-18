class AddMetadataToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :title, :string
    add_column :submissions, :year, :integer
    add_column :submissions, :medium, :string
    add_column :submissions, :price, :integer
  end
end
