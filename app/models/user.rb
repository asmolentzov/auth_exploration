class User < ApplicationRecord
  validates_presence_of :email, :name, :password
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = User.find_by(email: email)
    unless user
      return nil
    end
    if user.password == password
      user
    else
      nil
    end
  end
end