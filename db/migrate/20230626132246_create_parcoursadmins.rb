class CreateParcoursadmins < ActiveRecord::Migration[7.0]
  def change
    create_table :parcoursadmins do |t|
      t.string :devis_envoye, default: false
      t.string :devis_valide, default: false
      t.string :contrat_envoye, default: false
      t.string :contrat_signe, default: false
      t.string :convocation_envoye, default: false
      t.string :emargement, default: false

      t.timestamps
    end
  end
end
