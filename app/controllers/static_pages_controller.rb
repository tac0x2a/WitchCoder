class StaticPagesController < ApplicationController
  def index
    redirect_to '/problems/' if user_signed_in?
  end
end
