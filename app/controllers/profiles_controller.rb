class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    render 'pages/profile'
  end

end
