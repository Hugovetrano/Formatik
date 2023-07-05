class Session < ApplicationRecord
  belongs_to :programme
  belongs_to :intervenant
  has_many :inscriptions, dependent: :destroy
  geocoded_by :adresse
  after_validation :geocode, if: :will_save_change_to_adresse?
end
