class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :problems ]

  def home
    @home = true
  end

  def profile
    @current_user
  end

  def dashboard
    @problems = current_user.problems
  end
end
