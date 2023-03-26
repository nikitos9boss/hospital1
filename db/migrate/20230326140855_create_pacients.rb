class CreatePacients < ActiveRecord::Migration[7.0]
  def change
    create_table :pacients do |t|
      t.belongs_to :cardPacient
      t.string :name
      t.timestamps
    end
  end
end
