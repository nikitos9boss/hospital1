class CreateCardPacients < ActiveRecord::Migration[7.0]
  def change
    create_table :card_pacients do |t|
      t.string :name
      t.timestamps
    end
  end
end
