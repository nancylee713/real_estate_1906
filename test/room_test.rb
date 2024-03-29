require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'

require 'pry'
class RoomTest < Minitest::Test

  def setup
    @room = Room.new(:bedroom, 10, 13)
  end

  def test_it_exists
    assert_instance_of Room, @room
  end

  def test_it_has_attributes
    assert_equal :bedroom, @room.category
    assert_equal 130, @room.area

    # Built-in error handling in Ruby
    # assert_raises(TypeError) {
    #   Room.new(:bedroom, 'hello', 'world')
    # }
  end

  def test_it_can_have_another_room
    room_2 = Room.new(:kitchen, 20, 40)
    assert_equal :kitchen, room_2.category
    assert_equal 800, room_2.area
  end

end
