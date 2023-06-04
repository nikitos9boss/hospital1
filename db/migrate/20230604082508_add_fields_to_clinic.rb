class AddFieldsToClinic < ActiveRecord::Migration[7.0]
  def change
    add_column :clinics, :typeClinic, :string
    add_column :clinics, :city, :string
    add_column :clinics, :ratingMortality, :string
  end
end
