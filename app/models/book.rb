class Book < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_one_attached :image
  has_one :user, through: :post

  #validates :user_id, uniqueness: { scope: :post_id }

  def bookmarked_by?(user)
    books.where(user_id: user).exists?
  end

  self.primary_key = 'isbn'
end
