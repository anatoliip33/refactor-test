class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :ratings
  accepts_nested_attributes_for :ratings

  validates :user, :category, :title, :content, presence: true
end
