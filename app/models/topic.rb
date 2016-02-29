class Topic < ActiveRecord::Base
  belongs_to :lecture

  has_many :streams

  validates :number, presence:   true
  validates :title, presence:   true,
                   uniqueness: {scope: :number}

end
