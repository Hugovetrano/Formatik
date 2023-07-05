class Session < ApplicationRecord
  belongs_to :programme
  belongs_to :intervenant
  has_many :inscriptions, dependent: :destroy
  has_many :pre_inscriptions, dependent: :destroy
end
