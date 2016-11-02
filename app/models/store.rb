class Store

  def initialize(store)
    binding.pry
    @long_name = store[:longName]
    @city = store[:city]
    @distance = store[:distance]
    @phone = store[:phone]
    @store_type = store[:storeType]
    @store_id = store[:storeId]
  end

  def self.service
    BestBuyService.new
  end

  def self.all_stores_by_zip_code(zipcode)
    service.get_all_stores_by_zip_code(zipcode)[:stores].each do |store|
      new(store)
    end
  end
end
