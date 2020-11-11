class Anime < ApplicationRecord
	acts_as_taggable
	attachment :image

  	has_many :favorites, dependent: :destroy
  	belongs_to :user

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
