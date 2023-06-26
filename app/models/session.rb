class Session < ApplicationRecord
  belongs_to :programme
  belongs_to :intervenant
  has_many :inscriptions
end
