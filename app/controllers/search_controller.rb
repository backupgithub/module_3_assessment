class SearchController < ApplicationController
  def index
    @stores = Store.all_stores_by_zip_code(params[:zipcode])
    @total_store_found = Store.total_stores_found_by_zipcode(params[:zipcode])
  end
end
