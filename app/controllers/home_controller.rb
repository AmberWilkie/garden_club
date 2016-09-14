class HomeController < ApplicationController
  def index
  end

  def private
    if cannot? :private, current_user
      flash[:alert] = "You are not authorized to access that page"
      redirect_to root_path
    end
  end
end
