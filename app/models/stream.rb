class Stream < ActiveRecord::Base

  belongs_to :topic
  belongs_to :lecture

  validates :timestamp, presence: true, uniqueness: true

  validates :lecture_id, presence: true

  validates :topic_id, presence:   true

end
