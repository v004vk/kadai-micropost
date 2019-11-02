class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :users_who_favorites_this, through: :favorites, source: :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  def destroy
    self.favorites.delete_all
    super
  end
end
