class Member
  attr_reader :id, :name, :role, :house

  def initialize(member)
    @id = member[:_id]
    @name = member[:name]
    @role = member[:role]
    @house = member[:house]
  end
end
