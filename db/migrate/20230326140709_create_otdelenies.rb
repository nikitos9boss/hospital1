class CreateOtdelenies < ActiveRecord::Migration[7.0]
  def change
    create_table :otdelenies do |t|
      t.belongs_to :clinic
      t.belongs_to :doctor
      t.string :name
      t.timestamps
      t.references :clinic, foreign_key: true
      t.references :doctor, foreign_key: true
    end
  end
end
