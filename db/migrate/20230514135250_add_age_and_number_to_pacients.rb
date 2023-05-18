class AddAgeAndNumberToPacients < ActiveRecord::Migration[7.0]
  def change
    add_column :pacients, :age, :integer
    add_column :pacients, :number, :integer
  end
end
