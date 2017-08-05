class ProblemsController < ApplicationController
  # Create New Problem
  def new
    redirect_to new_user_session_path if not user_signed_in?
  end

  # Create New Problem
  def create
    redirect_to new_user_session_path if not user_signed_in?
  end
end
