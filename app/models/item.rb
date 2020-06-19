class Item < ApplicationRecord
	validates :genre_id,:image,:name,:detail,:price,presence: true

	belongs_to :genre
	has_many :cart_items

	attachment :image
end
