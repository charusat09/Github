class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(favorite_params)
    if favorite.save
      @favorites = Favorite.all
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    favorite = Favorite.find_by(id: params[:id])
    if favorite.present?
      favorite.destroy
      @favorites = Favorite.all
    end
  end

  private

  def favorite_params
    params.permit(:name, :language, :latest_tag)
  end
end
