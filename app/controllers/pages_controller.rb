class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home

  end

  def profile

  end

  def dashboard
    @problems = current_user.problems
  end
end
