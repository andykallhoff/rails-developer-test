require "bcrypt"

module TestPasswordHelper
  def encrypted_password
    BCrypt::Password.create('thisisapass', cost: 4)
  end
end
