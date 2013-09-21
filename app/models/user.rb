class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  has_many :decks, through: :rounds

  include BCrypt

  def password
    password ||= Password.new(password_hash)
  end

  def password=(new_password)
    self.password_hash = Password.create(new_password)
  end


  def self.authenticate(username, password)
    current_user = User.find_by_username(username)
    if current_user.password == password && current_user.username == username
      current_user
    else
      nil
    end
  end
end
