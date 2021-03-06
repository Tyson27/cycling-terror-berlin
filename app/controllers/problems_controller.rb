class ProblemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :favorite]

  def index
    @problems = Problem.geocoded

    @markers = @problems.map do |problem|
      {
        lat: problem.latitude,
        lng: problem.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { problem: problem }),
        image_url: helpers.asset_url(
          if problem.category == "Construction work"
            "construction_work.png"
          elsif problem.category == "Cycling path"
            "cycling_path.png"
          else
            "glass.png"
          end
        )
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
    # .downcase to save the category correctly
    # @problem.category = @problem.category.downcase
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
    # @type = params[:type]
    if @problem.favoritors.include? current_user
      current_user.unfavorite(@problem)
      current_user.save
      puts "unfavourite"
      # redirect_to problems_path, notice: "You favorited #{@problem.description}"
    else
      current_user.favorite(@problem)
      current_user.save
      puts "favourite"
      # redirect_to problems_path, notice: "Unfavorited #{@problem.description}"
    end
  end

  private

  def problem_params
    params.require(:problem).permit(:category, :description, :location)
  end
end
