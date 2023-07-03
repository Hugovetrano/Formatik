class ChangeColumnNameForPreInscriptions < ActiveRecord::Migration[7.0]
  def change
    rename_column :pre_inscriptions, :niveau_eude, :niveau_etude
  end
end
