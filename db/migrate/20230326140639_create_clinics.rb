class CreateClinics < ActiveRecord::Migration[7.0]
  def change
    create_table :clinics do |t|
      t.belongs_to :otdelenie
      t.belongs_to :cardPacient
      t.string :name
      t.string :address
      t.timestamps
    end
  end
end
