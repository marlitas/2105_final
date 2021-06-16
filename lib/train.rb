class Train
  attr_reader :name, :type, :cargo
  def initialize(info)
    @name = info[:name]
    @type = info[:type]
    @cargo = Hash.new(0)
  end

  def count_cars(car)
    @cargo[car]
  end

  def add_cars(car, amount)
    @cargo[car] = @cargo[car] + amount
  end

  def weight
    @cargo.sum do |car, amount|
      car.weight * amount
    end
  end
end
