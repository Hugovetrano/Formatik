class Intervenant < ApplicationRecord
  has_many :sessions
  validates :prenom, :nom, :email, :adresse, :code_postal, :ville,
            :telephone, presence: true
  validates :email, uniqueness: true
  has_one_attached :photo
end
