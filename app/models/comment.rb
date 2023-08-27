class Comment < ApplicationRecord
  belongs_to :aventure
  belongs_to :user
  has_many :likes
end
