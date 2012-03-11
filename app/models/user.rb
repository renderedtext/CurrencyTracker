class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :login, :password, :password_confirmation, :remember_me
  has_many :user_countries do
    def visited
      where(:visited => true)
    end
  end
  
  def visited_countries_hash
    Hash[user_countries.map{|item| [item.country_id, item]}]
  end
  
  def collected_currencies_hash
    Hash[user_countries.map{|item| [item.currency_id, item]}]
  end
    
end
