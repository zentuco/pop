class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_one :wallet
  has_many :contributions
  mount_uploader :photo, PhotoUploader
  after_create :create_wallet

  def full_name
    first_name + " " + last_name
  end

  def create_wallet
    Wallet.create(user: self, tokens: 0)
  end

end
