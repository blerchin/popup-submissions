class AddSlideToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :slide, :string
  end
end
