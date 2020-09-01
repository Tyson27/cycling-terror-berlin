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
    @user = current_user
    # @user.favorite(@problems.first)
  end

  def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @problem
      redirect_to :back, notice: 'You favorited #{@problem.name}'

    elsif type == "unfavorite"
      current_user.favorites.delete(@problem)
      redirect_to :back, notice: 'Unfavorited #{@problem.name}'

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end
end
