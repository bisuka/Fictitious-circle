class Admins::AnimeController < ApplicationController
    def index
        @animes = Anime.all
    end

    def edit
        if current_admin == nil
            redirect_to new_admin_session_path
        end
        @anime = Anime.find(params[:id])
        @animes = Anime.all
    end

    def show
        @anime = Anime.find(params[:id])
        @animes = Anime.all
    end

    def update
        anime = Anime.find(params[:id])
        if anime.update(anime_params)
            redirect_to admins_anime_path(anime)
        else
            @animes = Anime.all
            render :index
        end
    end

    def destroy
        anime = Anime.find(params[:id])
        anime.destroy
        redirect_to admins_anime_index_path
    end

    private
    def anime_params
        params.require(:anime).permit(:title, :circle, :activity_content, :image, :link, :tag_list)
    end
end
