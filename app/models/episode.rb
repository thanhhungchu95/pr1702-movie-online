class Episode < ApplicationRecord
  belongs_to :film
  has_many :link_episodes
end
