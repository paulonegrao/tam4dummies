class Stream < ActiveRecord::Base

  belongs_to :topic
  belongs_to :lecture

  has_many :dummits, dependent: :destroy

  validates :timestamp, presence: true, uniqueness: true

  validates :lecture_id, presence: true

  validates :topic_id, presence:   true

end
