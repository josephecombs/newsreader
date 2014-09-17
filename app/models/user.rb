class User < ActiveRecord::Base
  validates :username, :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  
  before_validation :ensure_session_token
    
  has_many(
    :user_feeds
  ) 
  
  has_many(
    :user_favorite_feeds
  )

  has_many(
    :user_favorite_entries
  )

  has_many(
    :feeds,
    through: :user_feeds,
    source: :feed
  )
  
  has_many(
    :favorite_feeds,
    through: :user_favorite_feeds, 
    source: :feed
  )
  
  has_many(
    :favorite_entries,
    through: :user_favorite_entries,
    source: :entry
  )
  
  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end
  
  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    if (user)
      return user if (user.is_password?(password))
    end
    return nil
  end
  
  def password
    @password
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password);
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end
  
  private
  
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
