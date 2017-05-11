class User < ApplicationRecord

  has_many :organizations, dependent: :destroy
  has_many :events, through: :organizations
  has_one :business, dependent: :destroy
  has_many :ads_as_advertiser, :class_name => "Ad", :foreign_key => :advertiser_id


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  delegate :can?, :cannot?, :to => :ability

  after_create :subscribe_to_mailchimp

  def organization?
    user_type == "organization"
  end

  def advertiser?
    user_type == "advertiser"
  end

  private

  def subscribe_to_mailchimp
    SubscribeToMailchimpJob.perform_later(self)
  end

end
