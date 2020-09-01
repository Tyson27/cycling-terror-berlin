class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :problems ]

  def home
    @home = true
  end

  def profile
    @current_user
  end

  def dashboard
    @user_problems = current_user.problems
    @user = current_user
    @favorites = @user.favorites_by_type('Problem')
    @favorite_problems = @favorites.map{ |favorite| favorite.favoritable }
  end
end
