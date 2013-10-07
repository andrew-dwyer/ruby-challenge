require 'test/unit'
require './seasons.rb'

class SeasonsTest < Test::Unit::TestCase

  def test_unknown_region
    assert_raise ArgumentError do
      Seasons.new(DateTime.new, :unknown_region)
    end
  end

  def test_invalid_time
    assert_raise ArgumentError do
      Seasons.new('text', :north)
    end
  end

  def test_valid_seasons
    assert_equal Seasons.new(DateTime.new(2012, 2, 5), :south).checkSeason, :summer
    assert_equal Seasons.new(DateTime.new(2012, 9, 6), :south).checkSeason, :spring
    assert_equal Seasons.new(DateTime.new(2012, 7, 7), :south).checkSeason, :winter
    assert_equal Seasons.new(DateTime.new(2012, 3, 8), :south).checkSeason, :autumn

    assert_equal Seasons.new(DateTime.new(2012, 2, 5), :north).checkSeason, :winter
    assert_equal Seasons.new(DateTime.new(2012, 9, 6), :north).checkSeason, :autumn
    assert_equal Seasons.new(DateTime.new(2012, 7, 7), :north).checkSeason, :summer
    assert_equal Seasons.new(DateTime.new(2012, 3, 8), :north).checkSeason, :spring

  end

  def test_edge_cases
    assert_equal Seasons.new(DateTime.new(2012, 12, 1, 0, 0), :south).checkSeason, :summer
    assert_equal Seasons.new(DateTime.new(2012, 2, 29, 23, 59), :south).checkSeason, :summer
    assert_equal Seasons.new(DateTime.new(2012, 9, 1, 0, 0), :south).checkSeason, :spring
    assert_equal Seasons.new(DateTime.new(2012, 11, 30, 23, 59), :south).checkSeason, :spring
    assert_equal Seasons.new(DateTime.new(2012, 6, 1, 0, 0), :south).checkSeason, :winter
    assert_equal Seasons.new(DateTime.new(2012, 8, 31, 23, 59), :south).checkSeason, :winter
    assert_equal Seasons.new(DateTime.new(2012, 3, 1, 0, 0), :south).checkSeason, :autumn
    assert_equal Seasons.new(DateTime.new(2012, 5, 31, 23, 59), :south).checkSeason, :autumn
  end

end