class SubscribeToMailchimpJob < ApplicationJob
  queue_as :default

  def perform(user)
    gb = Gibbon::API.new
    gb.lists.subscribe({
      :id => ENV["MAILCHIMP_LIST_ID"],
      :email => {:email => user.email},
      :merge_vars => {
        :FNAME => user.first_name,
        :LNAME => user.last_name,
        :USERTYPE => user.user_type},
        :double_optin => false
      }
    )
  end
end
