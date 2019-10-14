class HarryPotterFacade

  def initialize(house)
    @house = house
    @service = HarryPotterApiService.new.get_harry_potter_data(@house)
  end

  def members
    @service.map do |member|
       Member.new(member)
    end
  end
end
