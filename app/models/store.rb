class Store

  def initialize(store)
    binding.pry
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
