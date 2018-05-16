class Relationship < ApplicationRecord
  belongs_to :user_1, class_name: User.name
  belongs_to :user_2, class_name: User.name
end
