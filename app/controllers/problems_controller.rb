class ProblemsController < ApplicationController

  def index
    @problems = Problem.all

     @markers = @problems.geocoded.map do |problem|
      {
        lat: problem.latitude,
        lng: problem.longitude
      }
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
end

  private

  def problem_params
    params.require(:problem).permit(:category, :description, :location)
  end
end
