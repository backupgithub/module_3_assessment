class BestBuyService

  def get_all_stores_by_zip_code(zipcode)
    response = connection.get do |req|
      req.url ("stores(area(#{zipcode},25))")
      req.params['apiKey'] = ENV['bestbuykey']
      req.params['format'] = 'json'
      req.params['pageSize'] = '15'
      req.params['show'] = 'longName,city,distance,phone,storeType,storeId'
    end
    parser(response)
  end

  def get_total_stores_found_by_zipcode(zipcode)
    response = connection.get do |req|
      req.url ("stores(area(#{zipcode},25))")
      req.params['apiKey'] = ENV['bestbuykey']
      req.params['format'] = 'json'
      req.params['pageSize'] = '15'
      req.params['show'] = 'longName,city,distance,phone,storeType,storeId'
    end
    parser(response)
  end

  private

  def parser(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
      Faraday.new(:url => 'https://api.bestbuy.com/v1/') do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end
