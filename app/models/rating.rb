class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  after_save :average_score

  validates :user, :story, :rate, presence: true
  validates :user, uniqueness: true

  def average_score
    story.update({rating: Rating.where(story: story).average(:rate)})
  end

end
