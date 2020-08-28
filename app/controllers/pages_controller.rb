class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @home = true
  end

  def profile
  end

  def dashboard
  end

end
