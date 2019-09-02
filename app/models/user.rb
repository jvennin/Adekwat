class User < ApplicationRecord
  has_many :itineraries
  has_one :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :init_profile

  def init_profile
    Profile.create(user: self)
  end
end
