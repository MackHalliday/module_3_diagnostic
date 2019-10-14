class SearchController < ApplicationController
  def index
  @house = params[:house]
  @members = HarryPotterApiService.new.get_harry_potter_data(@house)
  end
end
