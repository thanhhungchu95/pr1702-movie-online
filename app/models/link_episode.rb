class LinkEpisode < ApplicationRecord
  belongs_to :episode
  enum quality: {low: 1, medium: 2, high: 3}
end
