class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :book, dependent: :destroy
  validates :star, presence: true
end
