class Users::AnimeController < ApplicationController
 	# 新着・ランキング表示
	def top
		@animes = Anime.all
		@tags = Anime.tag_counts_on(:tags).most_used(20)
		@ranks = Favorite.group(:anime_id).order('count(anime_id) desc').limit(10)
	end

	# アニメ登録
	def index
		@anime = Anime.new
		@animes = Anime.all
		@tags = Anime.tag_counts_on(:tags).most_used(20)

		# アニメ検索
		if params[:title].present?
			@animes = Anime.where('title LIKE ?', "%#{params[:title]}%")
		end
	end

	# アニメ作成
	def create
        anime = Anime.new(anime_params)
        anime.user_id = current_user.id
        if anime.save
        	redirect_to users_anime_index_path
        else
        	@animes = Anime.all
        	render :index
    	end
	end

	# アニメ編集
	def edit
		if current_user == nil
			redirect_to new_user_session_path
		end
		@anime = Anime.find(params[:id])
		@animes = Anime.all
		@tags = Anime.tag_counts_on(:tags).most_used(20)
	end

	# アニメ詳細
	def show
  		@anime = Anime.find(params[:id])
  		@animes = Anime.all
  		@tags = Anime.tag_counts_on(:tags).most_used(20)
  		@user = @anime.user
	end

	# アニメ更新
	def update
  		anime = Anime.find(params[:id])
        if anime.update(anime_params)
        	redirect_to users_anime_path(anime)
        else
        	@animes = Anime.all
        	render :index
    	end
	end

	# アニメ削除
	def destroy
		anime = Anime.find(params[:id])
		anime.destroy
		redirect_to users_anime_index_path
	end

	# アニメ登録
	def tag
		@name = params[:name]
		@animes = Anime.tagged_with(params[:name])
  		@tags = Anime.tag_counts_on(:tags).most_used(20)

  		# group 同名カラムを一つにまとめる,	order 並び替え
    	@ranks = Favorite.group(:anime_id).order('count(anime_id) desc').limit(10)
	end

	private
	def anime_params
		params.require(:anime).permit(:title, :circle, :activity_content, :image, :link, :tag_list)
	end
end
