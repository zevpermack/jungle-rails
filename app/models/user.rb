class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true, length: {
    minimum: 2,
    tokenizer: lambda { |str| str.scan(/\w+/) },
    too_short: "must have first and last name"
  }
  validates :password, presence: true
  validates :password_confirmation, presence: true, length: { minimum: 7 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, pw) 
    @email = email.downcase.strip
    User.find_by(email: @email)&.authenticate(pw)
  end
end
