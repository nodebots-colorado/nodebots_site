class AdminController < ApplicationController
  before_action :authorize?

  private

  def authorize?
    unless current_user && current_user.admin == true
      redirect_to '/'
    end
  end

end