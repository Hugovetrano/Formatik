class CreateIntervenants < ActiveRecord::Migration[7.0]
  def change
    create_table :intervenants do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :adresse
      t.string :code_postal
      t.string :ville
      t.string :telephone
      t.string :num_da
      t.string :siret
      t.integer :tarif

      t.timestamps
    end
  end
end
