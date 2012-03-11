class CurrenciesController < ApplicationController
  # GET /currencies
  # GET /currencies.xml
  def index
    @currencies = Currency.search_for(params[:q])
    @user_currencies = current_user.collected_currencies_hash
    if request.xhr?
      render :partial => 'list', :layout => false
    end
  end
  
  def collect
    if request.xhr?
      begin
        Currency.where(:code => params[:currency]).joins(:country).each do |currency|
          current_user.user_countries.create(:visited => true, :currency_id => currency.code, :country_id => currency.country.code)
        end
      rescue
        render :json => {}.to_json, :status => :unprocessable_entity
      else
        render :json => {:collected => params[:currency], :visited => visited_countries_count, :not_visited => not_visited_countries_count}.to_json, :status => :ok
      end
    else
      redirect_to :action => :index
    end
  end
  
end