class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length:{ maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :myserifs, dependent: :destroy
    
    has_many :favorites, dependent: :destroy
    has_many :likes, through: :favorites, source: :myserif
    
    has_many :comments, dependent: :destroy
    
    def favorite(myserif)
        favorites.find_or_create_by(myserif_id: myserif.id)
    end
    
    def unfavorite(myserif)
        favorite = favorites.find_by(myserif_id: myserif.id)
        favorite.destroy if favorite
    end
    
    def liked?(myserif)
        self.likes.include?(myserif)
    end
end