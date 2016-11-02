class SearchController < ApplicationController
  def index
    @stores = Store.find_all_stores_by_zip_code(params[:zipcode])
  end
end


class Store

  def self.find_all_stores_by_zip_code(zipcode)
    conn = Faraday.new(:url => 'https://api.bestbuy.com/v1/') do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    response = conn.get do |req|
      req.url ("stores(area(#{zipcode},25))")
      req.params['apiKey'] = ENV['bestbuykey']
      req.params['format'] = 'json'
      req.params['pageSize'] = '15'
      req.params['show'] = 'longName,city,distance,phone,storeType,storeId'
    end
    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end
end
