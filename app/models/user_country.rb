class UserCountry < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  belongs_to :currency
  
  validates :currency_id, :uniqueness => {:scope => [:user_id, :country_id]}
  
end
