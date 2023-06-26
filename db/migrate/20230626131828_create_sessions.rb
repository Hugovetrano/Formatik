class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.datetime :date_debut
      t.datetime :date_fin
      t.string :nom
      t.references :programme, null: false, foreign_key: true
      t.references :intervenant, null: false, foreign_key: true
      t.integer :prix
      t.string :adresse

      t.timestamps
    end
  end
end
