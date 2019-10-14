require 'rails_helper'


describe 'harry potter api service' do
  it "harry potter member data", :vcr do

    user = create(:user, harry_potter_token: ENV["GITHUB_API_KEY"])

    service = HarryPotterApiService.new

    raw_data = service.get_harry_potter_data(user)

    expect(service).to be_a(HarryPotterApiService)
    expect(raw_data).to be_a(Array)

    expect(raw_data.first).to have_key(:id)
    expect(raw_data.first).to have_key(:role)
    expect(raw_data.first).to have_key(:house)
    expect(raw_data.first).to have_key(:patronus)
  end
end
