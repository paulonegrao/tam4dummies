class Lecture < ActiveRecord::Base
  has_many :topics, dependent: :nullify
  has_many :streams, through: :topics

  validates :subject, presence: true
end
