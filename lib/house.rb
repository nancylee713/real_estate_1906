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
end
