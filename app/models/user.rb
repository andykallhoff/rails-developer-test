class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_default_role

  ROLES = %w(admin editor vanilla guest).freeze

  def admin?
    role == "admin"
  end

  def editor?
    role == "editor"
  end

  def vanilla?
    role == "vanilla"
  end

  private
    def set_default_role
      self.role ||= "guest"
    end
end
