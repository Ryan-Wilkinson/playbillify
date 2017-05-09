class AddStripeCardTokenToRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :card_token, :string
  end
end
