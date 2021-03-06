class Store
  attr_reader :long_name, :city, :distance, :phone, :store_type, :store_id

  def initialize(store)
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
    service.get_all_stores_by_zip_code(zipcode)[:stores].map do |store|
      new(store)
    end
  end

  def self.total_stores_found_by_zipcode(zipcode)
    service.get_total_stores_found_by_zipcode(zipcode)[:total]
  end
end
