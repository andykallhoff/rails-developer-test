class Article < ApplicationRecord
  belongs_to :user
  validates :title, :content, :category, :user, presence: true

  CATEGORIES = %w(curious funny serious other)
end
