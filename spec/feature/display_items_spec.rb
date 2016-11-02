require 'rails_helper'

RSpec.feature "Test it reaches the root page" do
  it "can access the root page" do

    visit '/'
    assert_equal 200, page.status_code

    within('h1') do
      expect(page).to have_content('Items')
      expect(page).to have_content("0 Items")
    end
  end
end
