class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name,:first_name,:first_name_kana,:last_name_kana,:postal_code,:address,:phone_number,presence: true

  acts_as_paranoid

  has_many :cart_items
  has_many :orders
  has_many :shippings

  def active_for_authentication?
  	super && (self.is_valid == true)
  end
  	
end
