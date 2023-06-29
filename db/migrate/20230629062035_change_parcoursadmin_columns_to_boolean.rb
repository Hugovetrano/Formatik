class ChangeParcoursadminColumnsToBoolean < ActiveRecord::Migration[7.0]
  def change
    remove_column :parcoursadmins, :devis_envoye
    remove_column :parcoursadmins, :devis_valide
    remove_column :parcoursadmins, :contrat_envoye
    remove_column :parcoursadmins, :contrat_signe
    remove_column :parcoursadmins, :convocation_envoye
    remove_column :parcoursadmins, :emargement

    add_column :parcoursadmins, :devis_envoye, :boolean, default: false
    add_column :parcoursadmins, :devis_valide, :boolean, default: false
    add_column :parcoursadmins, :contrat_envoye, :boolean, default: false
    add_column :parcoursadmins, :contrat_signe, :boolean, default: false
    add_column :parcoursadmins, :convocation_envoye, :boolean, default: false
    add_column :parcoursadmins, :emargement, :boolean, default: false
  end
end
