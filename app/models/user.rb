require 'securerandom'

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :items

  after_create :set_auth_token
  
  protected

  def set_auth_token
    begin
      self.auth_token = SecureRandom.uuid.gsub(/\-/, '')
    end while self.class.exists?(auth_token: auth_token)
  end

end
