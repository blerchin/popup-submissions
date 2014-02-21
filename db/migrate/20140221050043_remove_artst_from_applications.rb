class RemoveArtstFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :artst_id, :string
  end
end
