class Food
  attr_reader :name, :id

  def initialize(data)
    @name = data[:food][:label]
    @id = data[:food][:foodId]
  end
end
