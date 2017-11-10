# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string           not null
#  session_token   :string           not null
#


class User < ActiveRecord::Base
    attr_reader :password
    validates :username, :password_digest, :session_token, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }

    has_many :goals

    has_many :authored_comments,
    foreign_key: :user_id,
    class_name: :Comment

    has_many :comments, as: :commentable


    before_validation :ensure_session_token

    def password=(password)
        @password = password 
        self.password_digest = BCrypt::Password.create(password)
    end 

    def self.find_by_credentials(username, password)
        user = User.find_by_username(username)
        return nil if user.nil?
        BCrypt::Password.new(user.password_digest).is_password?(password) ? user : nil
    end 

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end
    
    def reset_session_token! 
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
    end 

end
