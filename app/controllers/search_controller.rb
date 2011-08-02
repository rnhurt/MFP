class SearchController < ApplicationController
  respond_to  :html, :json

  def show
    @results = Search.find(params[:id])
    respond_with @results
  end
end
