class SearchController < ApplicationController
  def index
    @facade = HarryPotterFacade.new(params[:house])
  end
end
