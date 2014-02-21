class AddApplicationContractToExhibition < ActiveRecord::Migration
  def change
    add_column :exhibitions, :application_contract, :text
  end
end
