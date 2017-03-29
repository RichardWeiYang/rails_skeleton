class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :confirm_within => 5.days
  validates :nickname, presence: true

  scope :name_alphabetical, -> { order('nickname ASC') }
  scope :name_alphabetical_rev, -> { order('nickname DESC') }

  has_many :hobbyships
  has_many :hobbies, :through => :hobbyships
end
