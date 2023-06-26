class CreateInscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :inscriptions do |t|
      t.references :apprenant, null: false, foreign_key: true
      t.references :session, null: false, foreign_key: true
      t.references :parcoursadmin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
