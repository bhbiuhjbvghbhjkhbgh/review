class Book < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_one :user, through: :post
  has_one_attached :image




  validates :user_id, uniqueness: { scope: :bookmark_id }

  def bookmarked_by?(user)
    Bookmark.where(user_id: user).exists?
  end

  self.primary_key = 'isbn'
end
