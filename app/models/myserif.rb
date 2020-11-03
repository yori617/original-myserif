class Myserif < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 50 }
  validates :character, length: { maximum: 100 }
  validates :genre, presence: true
  
  has_many :genres
  
  has_many :favorites
  has_many :likes, through: :favorites, source: :users
  
  has_many :comments, dependent: :destroy
  
end