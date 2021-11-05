class Food
  attr_reader :name, :food_id

  def initialize(data)
    @name = data[:food][:label]
    @food_id = data[:food][:foodId]
  end
end
