class AddYearToClinics < ActiveRecord::Migration[7.0]
  def change
    add_column :clinics, :year, :integer
  end
end
