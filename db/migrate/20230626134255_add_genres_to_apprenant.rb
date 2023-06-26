class AddGenresToApprenant < ActiveRecord::Migration[7.0]
  def change
    add_column :apprenants, :genre, :string
  end
end
