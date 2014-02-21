class AddExhibitionToSubmissions < ActiveRecord::Migration
  def change
    add_reference :submissions, :exhibition
  end
end
