
class HarryPotterApiService

  def get_harry_potter_data(house)
    json_response = conn.get('v1/characters', key: ENV['GITHUB_API_KEY'], house: house)
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: 'https://www.potterapi.com/'
    )
  end
end
