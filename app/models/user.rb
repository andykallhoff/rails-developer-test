class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  before_create :set_default_role

  ROLES = %w(admin editor guest).freeze
  validates :role, inclusion: { in: ROLES, message: "That is not a valid role." }

  def editor?
    role == "editor"
  end

  def admin?
    role == "admin"
  end

  private
    def set_default_role
      self.role ||= "guest"
    end
end
