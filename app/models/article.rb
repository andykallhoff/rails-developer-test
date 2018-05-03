class Article < ApplicationRecord
  belongs_to :user
  validates :title, :content, :category, :user, presence: true

  CATEGORIES = %w(curious funny serious other)

  default_scope { order(id: :desc) }
  scope :category, lambda { |c| where(:category => c) }
end
