require 'rails_helper'

RSpec.feature "When a user search stores by zipcode" do
  it "should get back stores information" do
    VCR.use_cassette('stores_by_zip_code_and_distance') do
      # As a user
      # When I visit "/"
      visit '/'
      # And I fill in a search box with "80202" and click "search"
      within('.search-field') do
        fill_in :zipcode, with: 80202
        click_on 'Search'
      end
      # Then my current path should be "/search" (ignoring params)
      expect(current_path).to eq('/search')
      # And I should see stores within 25 miles of 80202
      expect(page).to have_content('Please see stores within 25 miles from Zipcode 80202')
      # And I should see a message that says "17 Total Stores"
      expect(page).to have_content("Found a total of 17 store in your area")
      # And I should see exactly 15 results
      # And I should see the long name, city, distance, phone number and store type for each of the 15 results
      within('.info') do
        expect(page).to have_content('Name')
        expect(page).to have_content('City')
        expect(page).to have_content('Distance')
        expect(page).to have_content('Phone')
        expect(page).to have_content('Store Type')
        expect(page).to have_selector('.store-info', count: 15)
      end
    end
  end
end
