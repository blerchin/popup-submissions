class AddApplicationToSubmissions < ActiveRecord::Migration
  def change
    add_reference :submissions, :application, index: true
  end
end
