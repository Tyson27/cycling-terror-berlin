class ProblemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index]

  # def index
  #   @problems = Problem.all

  #    @markers = @problems.geocoded.map do |problem|
  #     {
  #       lat: problem.latitude,
  #       lng: problem.longitude
  #     }
  #   end
  # end

  def index
    @problems = Problem.geocoded

    @markers = @problems.map do |problem|
      {
        lat: problem.latitude,
        lng: problem.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { problem: problem }),
        image_url: helpers.asset_url("#{problem.category}.png")
      }
    end
  end

  def show
    @problem = Problem.find(params[:id])
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    @problem.user = current_user
    @problem.date = DateTime.now

    if @problem.save!
      redirect_to problems_path, notice: 'Problem was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @problem.update(problem_params)
      # redirect_to @problem, notice: 'Problem was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @problem.destroy
    # redirect_to ..._url, notice: 'Problem was successfully destroyed'
  end


  def favorite
    @problem = Problem.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorite(@problem)
      redirect_to dashboard_path, notice: "You favorited #{@problem.description}"

    elsif type == "unfavorite"
      current_user.unfavorite(@problem)
      redirect_to dashboard_path, notice: "Unfavorited #{@problem.description}"
    else
      # Type missing, nothing happens
      redirect_to dashboard_path, notice: 'Nothing happened.'
    end
  end



  private

  def problem_params
    params.require(:problem).permit(:category, :description, :location)
  end
end
