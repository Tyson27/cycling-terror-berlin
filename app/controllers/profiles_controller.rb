class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user=current_user
    render 'pages/profile'
  end

end
