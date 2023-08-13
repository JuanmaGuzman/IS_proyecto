class Lesson < ApplicationRecord
  belongs_to :course
  has_many :forums
  has_one_attached :video
end
