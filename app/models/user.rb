# frozen_string_literal: true

class User < ApplicationRecord
  has_many :inscriptions
  has_many :reviews
  has_many :forums
  has_many :courses, through: :inscriptions
  has_one_attached :porfile_image
   
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
end
