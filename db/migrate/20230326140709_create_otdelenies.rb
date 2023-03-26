class CreateOtdelenies < ActiveRecord::Migration[7.0]
  def change
    create_table :otdelenies do |t|
      t.string :name
      t.timestamps
    end
  end
end
