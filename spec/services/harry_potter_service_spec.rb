require 'rails_helper'


describe 'harry potter api service' do
  it "harry potter member data", :vcr do

    service = HarryPotterApiService.new

    raw_data = service.get_harry_potter_data("Gryffindor")

    expect(service).to be_a(HarryPotterApiService)

    expect(raw_data).to be_a(Array)

    expect(raw_data[0]).to have_key(:_id)
    expect(raw_data[0]).to have_key(:role)
    expect(raw_data[0]).to have_key(:house)
    expect(raw_data[9]).to have_key(:patronus)
  end
end
