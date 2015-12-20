class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :ratings

  validates :user, :category, :title, :content, presence: true
end
