class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  helper_method :visited_countries_count, :not_visited_countries_count, :collected_countries_count, :not_collected_countries_count
  
  def visited_countries_count
    current_user.user_countries.visited.count(:country_id, :distinct => true)
  end
  
  def not_visited_countries_count
    Country.count - visited_countries_count
  end
  
  def collected_countries_count
    current_user.user_countries.visited.count
  end
  
  def not_collected_countries_count
    Currency.count - collected_countries_count
  end
  
end
