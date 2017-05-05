class StaticPagesController < ApplicationController
  def home
    @user = current_user
    @organizations = Organization.where(user_id: current_user.id)
  end
end
