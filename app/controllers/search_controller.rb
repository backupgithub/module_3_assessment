class SearchController < ApplicationController
  def index
    @stores = Store.find_all_stores_by_zip_code(params[:zipcode])
  end
end


class Store

  def self.find_all_stores_by_zip_code(zipcode)
    binding.pry
  end

end
