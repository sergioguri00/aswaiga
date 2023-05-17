class User < ApplicationRecord
  has_many :issues
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

         has_one_attached :image
  has_and_belongs_to_many :watched_issues, class_name: 'Issue'
 def self.from_omniauth(auth)
   where(uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     user.full_name = auth.info.name
   end
 end
end