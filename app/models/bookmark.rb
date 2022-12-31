class Bookmark < ApplicationRecord
  belongs_to :user
  #belongs_to :post
  belongs_to :book
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
  validates :user_id, uniqueness: { scope: :book_id }
end
