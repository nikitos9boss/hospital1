class AddForeignKeysToCardPacients < ActiveRecord::Migration[7.0]
  def change

    add_foreign_key :card_pacients, :pacients

    add_foreign_key :card_pacients, :clinics
  end
end
