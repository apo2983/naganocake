class Shipping < ApplicationRecord

	belongs_to :end_user

	def shipping_property
		 self.postal_code + self.address + self.name
	end
end
