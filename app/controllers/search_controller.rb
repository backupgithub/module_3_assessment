class SearchController < ApplicationController
  def index
    @stores = Store.all_stores_by_zip_code(params[:zipcode])
  end
end
