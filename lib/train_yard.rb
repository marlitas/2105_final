class TrainYard
  attr_reader :location, :trains
  def initialize(info)
    @location = info[:location]
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def types_of_trains
    @trains.map do |train|
      train.type
    end.sort.uniq
  end

  def trains_containing(car)
    @trains.find_all do |train|
      train.cargo.keys.include?(car)
    end
  end

  def sorted_cargo_list
    @trains.flat_map do |train|
      train.cargo.map do |car, amount|
        car.type
      end
    end.sort.uniq
  end

  def total_inventory
    hash = Hash.new(0)
    @trains.each do |train|
      train.cargo.each do |car, amount|
        hash[car] = hash[car] + train.count_cars(car)
      end
    end
    hash
  end

  def overflow_cars
    total_inventory.find_all do |car, amount|
      (amount > 10) && (trains_containing(car).length > 1)
    end.flat_map do |array|
      array.first
    end
  end

  def unload(car, quantity)
    answer = sorted_cargo_list.include?(car.type) && (total_inventory[car] >= quantity)
    if answer == true
      @trains.each do |train|
        
      end
    end
    answer
  end
end
