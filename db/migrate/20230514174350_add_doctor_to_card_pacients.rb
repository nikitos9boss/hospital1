class AddDoctorToCardPacients < ActiveRecord::Migration[7.0]
  def change
    add_reference :card_pacients, :doctor, null: true, foreign_key: true
  end
end
