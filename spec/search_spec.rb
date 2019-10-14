require 'rails_helper'

# As a user,
# When I visit "/"
# And I Select "Griffindor" from the select field
# (Note: Use the existing select field)
# And I click "Search For Members"
# Then I should be on page "/search"
# Then I should see a total of the number of members for that house. (18 for Griffindor)
# Then I should see a list of 18 members
#
# And for each of the members I should see:
# - The name of the member
# - The members role (if it exists)
# - The house the member belongs to
# - The Patronus of the member (if it exists)

describe 'search functionality' do
  it 'can search for a member filtered by house' do
    user_1 = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    click_on 'Griffindor'
    click_on 'Search For Members'

    expect(current_path).to eq("/search")

    within "#member-1" do 
      expect(page).to have_content("Name")
      expect(page).to have_content("Role")
      expect(page).to have_content("House")
      expect(page).to have_content("Patronus")
    end
  end
end
