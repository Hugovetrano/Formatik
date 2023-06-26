class AddGenresToIntervenant < ActiveRecord::Migration[7.0]
  def change
    add_column :intervenants, :genre, :string
  end
end
