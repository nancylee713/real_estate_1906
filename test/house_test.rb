require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

require 'pry'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
    @room_3 = Room.new(:living_room, 25, 15)
    @room_4 = Room.new(:basement, 30, 41)
  end

  def test_it_exists
    assert_instance_of House, @house
  end

  def test_it_has_attributes
    assert_equal "$400000", @house.price
    assert_equal "123 sugar lane", @house.address
  end

  def test_it_can_have_another_house
    house_2 = House.new("$700000", "456 salt lane")
    assert_equal "$700000", house_2.price
    assert_equal "456 salt lane", house_2.address
  end

  def test_it_starts_out_with_no_rooms
    assert_equal [], @house.rooms
  end

  def test_it_can_add_rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)

    assert_equal [@room_1, @room_2], @house.rooms
  end


  def test_it_can_display_rooms_by_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    bedrooms = @house.rooms_from_category(:bedroom)
    basement = @house.rooms_from_category(:basement)

    assert_equal [@room_1, @room_2], bedrooms
    assert_equal [@room_4], basement
  end

  def test_it_can_calculate_total_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 1900, @house.area
  end

  def test_it_can_calculate_price_per_square_foot
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 210.53, @house.price_per_square_foot
  end

  def test_it_can_sort_rooms_by_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_4, @room_3, @room_2, @room_1], @house.rooms_sorted_by_area
  end

  def test_it_can_sort_rooms_by_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    expected = {
      :bedroom => [@room_1, @room_2],
      :living_room => [@room_3],
      :basement => [@room_4]
    }

    assert_equal expected, @house.rooms_by_category
  end

end
