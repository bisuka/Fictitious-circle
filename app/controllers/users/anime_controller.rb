class Users::AnimeController < ApplicationController
	def top
		@animes = Anime.all
	end

	# 新着・ランキング表示
	def index
		@anime = Anime.new
		@animes = Anime.all
	end

	# アニメ登録
	def create
        anime = Anime.new(anime_params)
        anime.user_id = current_user.id
        if anime.save
        	redirect_to root_path
        else
        	@animes = Anime.all
        	render :index
    	end
	end

	# アニメ編集
	def edit
		@anime = Anime.find(params[:id])
		@animes = Anime.all
	end

	# アニメ詳細
	def show
  		@anime = Anime.find(params[:id])
  		@animes = Anime.all
	end

	# アニメ更新
	def update
	end

	# アニメ削除
	def destroy
	end

	private
	def anime_params
		params.require(:anime).permit(:title, :circle, :activity_content, :image, :link)
	end
end
