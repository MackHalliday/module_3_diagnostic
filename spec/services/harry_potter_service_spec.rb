require 'rails_helper'


describe 'harry potter api service' do
  it "harry potter member data", :vcr do

    user = create(:user, harry_potter_token: ENV["GITHUB_API_KEY"])

    service = HarryPotterApiService.new

    raw_data = service.get_harry_potter_data(user)

    expect(service).to be_a(HarryPotterApiService)
    expect(raw_data).to be_a(Array)

    expect(raw_data.first).to have_key(:name)
    expect(raw_data.first).to have_key(:role)
    expect(raw_data.first).to have_key(:house)
    expect(raw_data.first).to have_key(:patronus)
  end

  it "github follower data", :vcr do

    user = create(:user, github_token: ENV["GITHUB_API_KEY"])

    service = GithubApiService.new

    raw_data = service.get_follower_data(user)

    expect(service).to be_a(GithubApiService)
    expect(raw_data).to be_a(Array)

    expect(raw_data.first).to have_key(:login)
    expect(raw_data.first).to have_key(:html_url)
  end

  it "github following data", :vcr do

    user = create(:user, github_token: ENV["GITHUB_API_KEY"])

    service = GithubApiService.new

    raw_data = service.get_following_data(user)

    expect(service).to be_a(GithubApiService)
    expect(raw_data).to be_a(Array)

    expect(raw_data.first).to have_key(:login)
    expect(raw_data.first).to have_key(:html_url)
  end
end
