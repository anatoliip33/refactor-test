class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :user, :category, :title, :content, presence: true
end
