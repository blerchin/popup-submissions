class RemoveExhibitionIdFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :exhibition_id, :string
  end
end
