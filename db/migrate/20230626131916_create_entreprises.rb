class CreateEntreprises < ActiveRecord::Migration[7.0]
  def change
    create_table :entreprises do |t|
      t.string :nom
      t.string :siret

      t.timestamps
    end
  end
end
