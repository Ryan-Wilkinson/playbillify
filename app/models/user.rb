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

  after_create :add_to_mailchimp

  def organization?
    user_type == "organization"
  end

  def advertiser?
    user_type == "advertiser"
  end

  private

  def add_to_mailchimp
    list_id = ENV['MAILCHIMP_LIST_ID']
    @gb = Gibbon::Request.new
    subscribe = @gb.lists(list_id).members.create(body: {
      email_address: self.email,
      status: "subscribed",
      double_optin: false,
      merge_fields: {
        FNAME: self.first_name,
        LNAME: self.last_name,
        USERTYPE: self.user_type
      }
    })
     rescue Gibbon::MailChimpError => exception
      Rails.logger.error("failed becuz #{exception.detail}")
  end

end
