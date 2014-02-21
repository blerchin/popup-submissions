class AddInstallationToSubmissions < ActiveRecord::Migration
  def change
    add_reference :submissions, :installation, index: true
  end
end
