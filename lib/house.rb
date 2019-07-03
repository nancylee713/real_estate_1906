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

  def price_per_square_foot
    (@price.slice(1..-1).to_f / area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort { |room| room.area }
  end

  def rooms_by_category
    categories = @rooms.map(&:category).uniq
    result = {}
    # iterate
    @rooms.each do |room|
      categories.each do |category|
        if room.category == category
        result[category] = rooms_from_category(category)
        end
      end
    end
    result
  end
end
