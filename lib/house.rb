class House

  attr_reader :price, :address, :rooms

  def initialize(price, address, rooms=[])
    @price = price
    @address = address
    @rooms = rooms
  end

  def add_room(new_room)
    @rooms << new_room
  end

  def rooms_from_category(category)
    @rooms.select { |room| room.category == category }
  end

  def area
    total_area = 0
    @rooms.each do |room|
      total_area += room.area
    end
    total_area
  end
end
