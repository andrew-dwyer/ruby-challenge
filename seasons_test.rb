require 'test/unit'
require './seasons.rb'

class SeasonsTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_seasons


    startDate = Date.new(2001,1,1)
    while(startDate.yday != 365)
      print Seasons.new(startDate).checkSeason    + "\n"
      startDate = startDate.next_day
    end
    print a.checkSeason + "\n"

  end

  # Fake test
  #def test_fail
  #
  #  # To change this template use File | Settings | File Templates.
  #  fail('Not implemented')
  #end
end