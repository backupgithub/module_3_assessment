require 'rails_helper'

describe Store do
  it "returns the count of total stores found given a zip code" do
    VCR.use_cassette("stores_by_zip_code_and_distance") do
      stores = Store.all_stores_by_zip_code(80202)
      last_store = stores.last

      expect(stores.count).to eq 15
    end
  end

  it "returns store information when given specific store" do
    VCR.use_cassette("stores_by_zip_code_and_distance") do
      stores = Store.all_stores_by_zip_code(80202)
      last_store = stores.last

      expect(last_store).to respond_to :long_name
      expect(last_store.long_name).to eq 'Best Buy - S.E. Aurora'

      expect(last_store).to respond_to :city
      expect(last_store.city).to eq 'Aurora'

      expect(last_store).to respond_to :distance
      expect(last_store.distance).to eq 18.51

      expect(last_store).to respond_to :phone
      expect(last_store.phone).to eq '303-693-0166'

      expect(last_store).to respond_to :store_type
      expect(last_store.store_type).to eq 'BigBox'
    end
  end
end
