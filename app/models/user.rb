class User < ApplicationRecord

  acts_as_voter
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable, :validatable

  validates :email, uniqueness: true

  has_one_attached :image

  has_many :categories
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
