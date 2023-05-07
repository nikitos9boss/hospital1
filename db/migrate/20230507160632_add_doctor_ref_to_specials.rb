class AddDoctorRefToSpecials < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :specials, :doctors, column: :doctor_id
  end
end
