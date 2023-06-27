class Inscription < ApplicationRecord
  belongs_to :apprenant
  belongs_to :session
  belongs_to :parcoursadmin, dependent: :destroy
end
