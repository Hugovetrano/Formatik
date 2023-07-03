class CreatePreInscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :pre_inscriptions do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :profession
      t.string :adresse_facturation
      t.string :code_postal
      t.string :ville
      t.string :telephone
      t.string :niveau_eude
      t.string :genre
      t.references :session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
