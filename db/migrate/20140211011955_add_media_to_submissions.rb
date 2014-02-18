class AddMediaToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :media, :string
  end
end
