class User < ActiveRecord::Base
  has_secure_password


  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password, length: {minimum: 5}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials (email, password)
    return nil if email.empty?

    # if e.size > 0
    #   email = email.split(" ")[0]
    #   if email
    #     email.downcase!
    #   end
    # end
    
    # @user = User.find_by("lower(email) = ?", email.squish.downcase).try(:authenticate, password)

    @user = User.find_by(email: email.strip.downcase)

    if (@user && @user.authenticate(password))
      return @user
    else
      return nil
    end
  end

end