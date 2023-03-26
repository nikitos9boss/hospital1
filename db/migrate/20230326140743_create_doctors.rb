class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.belongs_to :otdelenie
      t.belongs_to :special
      t.string :name
      t.string :stag
      t.timestamps
    end
  end
end
