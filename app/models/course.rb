# frozen_string_literal: true

class Course < ApplicationRecord
  # Relations
  has_many :reviews
  has_many :lessons
  has_many :inscriptions
  has_many :users, through: :inscriptions
end
