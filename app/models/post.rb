class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  
  validates :photo, :title, :description, presence: true
end
