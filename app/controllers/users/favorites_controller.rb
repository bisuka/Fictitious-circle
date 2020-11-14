class Users::FavoritesController < ApplicationController
	def create
		anime = Anime.find(params[:anime_id])
		favorite = current_user.favorites.new(anime_id: anime.id)
		favorite.save
		redirect_to users_anime_path(anime)
	end

	def destroy
		anime = Anime.find(params[:anime_id])
		favorite = current_user.favorites.find_by(anime_id: anime.id)
		favorite.destroy
		redirect_to users_anime_path(anime)
	end
end
