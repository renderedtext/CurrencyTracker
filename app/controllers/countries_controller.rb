class CountriesController < ApplicationController

  def index
    @countries = Country.search_for(params[:q])
    @user_countries = current_user.visited_countries_hash
    if request.xhr?
      render :partial => 'list', :layout => false
    end
  end
  
  def visit
    if request.xhr?
      begin
        countries = Country.where(:code => params[:country]).joins(:currencies).map do |country|
          country.code if country.currencies.map do |currency|
            current_user.user_countries.create(:visited => true, :currency_id => currency.code, :country_id => country.code)
          end.size > 0
        end
      rescue => e
        raise e
        render :json => e.backtrace.join("\n").to_json, :status => :unprocessable_entity
      else
        render :json => {:countries => countries, :uncheck => (params[:country] - countries),:visited => visited_countries_count, :not_visited => not_visited_countries_count}.to_json, :status => :ok
      end
    else
      redirect_to :action => :index
    end
  end
  
end