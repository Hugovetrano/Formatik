class CreateProgrammes < ActiveRecord::Migration[7.0]
  def change
    create_table :programmes do |t|
      t.string :titre
      t.string :description
      t.integer :prix

      t.timestamps
    end
  end
end
