class AddSpecialtyToIntervenants < ActiveRecord::Migration[7.0]
  def change
    add_column :intervenants, :specialite, :string
  end
end
