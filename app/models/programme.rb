class Programme < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_many :inscriptions, through: :sessions
end
