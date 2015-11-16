class User < ActiveRecord::Base
  has_many :bookmarks
  validates_presence_of :email
  validates_presence_of :password

  def authenticate(password)
    self.password == password
    return self
  end
end
