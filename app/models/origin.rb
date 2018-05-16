class Origin < ApplicationRecord
  has_many :film_origins
  has_many :films, through: :film_origins
end
