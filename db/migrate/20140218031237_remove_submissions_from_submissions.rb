class RemoveSubmissionsFromSubmissions < ActiveRecord::Migration
  def change
    remove_column :submissions, :submissions, :string
  end
end
