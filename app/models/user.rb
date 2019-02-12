class User < ApplicationRecord
  attr_accessor :password
  before_save :encrypt_password

  validates :email, {presence: true, uniqueness: true}
  validates :username, {presence: true, uniqueness: true}
  validates :password, confirmation: true, if: :password_required?

  def password_required?
    self.new_record? || !self.password.blank?
  end

  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest(pass + salt)
  end

  def encrypt_password
    return if password.blank?
    if new_record?
      self.salt = SecureRandom.hex(16)
    end
    self.password_hash = User.encrypt self.password, self.salt
  end

  def self.authenticate(username, pass)
    user = User.where(username: username).first
    user && user.authenticated?(pass) ? user : nil
  end

  def authenticated?(pass)
    self.password_hash == User.encrypt(pass, self.salt)
  end
end
