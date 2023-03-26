class CreateSpecials < ActiveRecord::Migration[7.0]
  def change
    create_table :specials do |t|
      t.belongs_to :doctor
      t.string :name
      t.timestamps
    end
  end
end
