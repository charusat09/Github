class ReposController < ApplicationController

  def index
    @repos = GithubRepo.new.search(params[:query]) if params[:query].present?
    @favorites = Favorite.all
  end
end
