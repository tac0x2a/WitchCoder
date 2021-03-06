class ProblemsController < ApplicationController
  def index
    @problems = Problem.select{|p| p.publish_status == "published"}
  end


  # Create New Problem
  def new
    redirect_to new_user_session_path if not user_signed_in?
    @problem = Problem.new(user_id: current_user)
    @problem.cases.build
  end

  # Create New Problem
  def create
    redirect_to new_user_session_path if not user_signed_in?
    @problem = Problem.new(problem_params)
    @problem.user_id = current_user.id

    if @problem.save
      redirect_to action:"show", id:@problem.id, notice:"Registered New Problem!"
    else
      render 'new'
    end
  end

  def show
    @problem = Problem.find(params[:id])
  end

  private
  def problem_params
    params.require(:problem).permit(
      :title,
      :description,
      :publish_status,
      :cases_attributes => [:input, :expected, :_destroy]
    )
  end
end
