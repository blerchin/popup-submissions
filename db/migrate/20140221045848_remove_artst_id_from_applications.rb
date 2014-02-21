class RemoveArtstIdFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :artst, :string
  end
end
