class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :book, dependent: :destroy
  
  def booked_by?(user)
    books.where(user_id: user).exists?
  end
end
