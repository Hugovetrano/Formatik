class Programme < ApplicationRecord
  has_many :sessions, dependent: :destroy
end
