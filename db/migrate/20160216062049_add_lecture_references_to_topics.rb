class AddLectureReferencesToTopics < ActiveRecord::Migration
  def change
    add_reference :topics, :lecture, index: true, foreign_key: true
  end
end
