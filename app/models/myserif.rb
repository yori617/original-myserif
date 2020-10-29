class Myserif < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 50 }
  validates :character, presence: true, length: { maximum: 100 }
  
  has_one :genre
end