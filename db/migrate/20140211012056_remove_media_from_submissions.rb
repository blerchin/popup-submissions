class RemoveMediaFromSubmissions < ActiveRecord::Migration
  def change
    remove_column :submissions, :media, :string
  end
end
