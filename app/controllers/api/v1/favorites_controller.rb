class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])

    if user
      favorite = user.favorites.create!(favorite_params)

      if favorite.save
        render json: { success: "Favorite added successfully" }, status: 201
      else
        render json: { error: favorite.errors.full_messages.to_sentence }, status: 400
      end
    else
      render json: { error: "Invalid API Key" }, status: 400
    end
  end

  private

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end
