class User < ApplicationRecord
  has_many :organizations
  has_many :events, through: :organizations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  delegate :can?, :cannot?, :to => :ability

  def organization?
    user_type == "organization"
  end

  def advertiser?
    user_type == "advertiser"
  end
end
