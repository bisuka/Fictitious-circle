class Anime < ApplicationRecord
	acts_as_taggable

  	belongs_to :user
	attachment :image
end
