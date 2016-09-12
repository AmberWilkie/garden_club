class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, confirmation: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  # , uniqueness: { case_sensitive: false } --> want to get this working on email

  before_save do
    self.password == self.password_confirmation
  end

end
